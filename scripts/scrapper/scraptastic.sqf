private["_type","_objectID","_objectUID","_chopShopClasses","_maxDistance","_toolBreak","_num","_isOk","_proceed","_limit","_counter"];

if (dayz_actionInProgress) exitWith {localize "STR_EPOCH_PLAYER_21" call dayz_rollingMessages;};
dayz_actionInProgress = true;

_vehicle = _this select 3;
_type = typeOf _vehicle;
_vehName = getText(configFile >> "cfgVehicles" >> _type >> "displayName");

_objectID = _vehicle getVariable["ObjectID","0"];
_objectUID = _vehicle getVariable["ObjectUID","0"];

_chopShopClasses = ["Land_repair_center"]; //list of classes that you must be near in order to scrap a vehicle
_maxDistance = 50; //keeping it relatively close, id love yo make you park it in a shop but that wouldnt work so well fo airplanes and helicopters....
_chopShops = (nearestObjects [getPosATL _vehicle,_chopShopClasses,_maxDistance]);

_toolBreak = random 100;
_num = 3;

_fn_del_vehicle = { //this is not my function, i personally tried to reference it from AdminTools but I could not get it to work
  PVDZ_obj_Destroy = [_objectID,_objectUID,(name player)]; //all credit for this function goes to noxSicarious/JasonTM
  publicVariableServer "PVDZ_obj_Destroy";
  if (isServer) then {
    PVDZ_obj_Destroy call server_deleteObj;
  };
  deletevehicle _vehicle;
};

_fn_dmg_veh = {
    _hitpoints = _vehicle call vehicle_getHitpoints;
    {
      _damage = [_vehicle,_x] call object_getHit;
      _selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
      [_vehicle,_selection,(_damage + 0.2)] call fnc_veh_handleDam;
    } forEach _hitpoints;
    PVDZ_veh_Save = [_vehicle,"damage"];
    publicVariableServer "PVDZ_veh_Save";
};

if (dayz_actionInProgress) exitWith {localize "str_player_actionslimit" call dayz_rollingMessages;};

if !(count _chopShops > 0) exitWith {systemChat("You scrap a whole vehicle out in the open, get to a Chop Shop!");};

if ((count (crew _vehicle)) != 0) exitWith {systemChat("You can't scrap a vehicle while it is occupied!");};

if (_num == 3) then {
  if (_vehicle isKindOf "Car") then { //car first because it covers every vehicle, hopefully we can overrwrite with others afterward
    _num = 5;
  };
  if (_vehicle isKindOf "Motorcycle") then {
    _num = 3;
  };
  if (_vehicle isKindOf "Bicycle") then {
    _num = 2;
  };
  if (_vehicle isKindOf "Truck") then {
    _num = 6;
  };
  if (_vehicle isKindOf "WheeledAPC") then {
    _num = 7;
  };
  if (_vehicle isKindOf "Tank") then {
    _num = 9;
  };
  if (_vehicle isKindOf "TrackedAPC") then {
    _num = 8;
  };
  if (_vehicle isKindOf "Helicopter") then {
    _num = 10;
  };
  if (_vehicle isKindOf "Plane") then {
    _num = 12;
  };
  if (_type == "c130J_US_EP1_DZ") then {
    _num = 15;
  };
};

_isOk = true;
_proceed = false;
_limit = _num;
_counter = 0;

while {_isOk} do {
  
  ["Working",0,[20,48,15,0]] call dayz_NutritionSystem;
  player playActionNow "Medic";
  
  cutText [format["Scrapping of %1 in progress, stage %2 of %3",_vehName,(_counter + 1),_limit], "PLAIN DOWN"];
  
  _dis=20;
  _sfx = "repair";
  [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
  [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
  
  r_interrupt = false;
  r_doLoop = true;
  _started = false;
  _finished = false;
  DZE_cancelBuilding = false;

  if ((count (crew _vehicle)) != 0) exitWith {systemChat("You can't scrap a vehicle while it is occupied!");DZE_cancelBuilding = true;};
  
  while {r_doLoop} do {
    _animState = animationState player;
    _isMedic = ["medic",_animState] call fnc_inString;
    
    if ((count (crew _vehicle)) != 0) exitWith {systemChat("You can't scrap a vehicle while it is occupied!");DZE_cancelBuilding = true;};
    
    if (_isMedic) then {
        _started = true;
    };
    if (_started && !_isMedic) then {
        r_doLoop = false;
        _finished = true;
    };
    if (r_interrupt || (player getVariable["inCombat",false])) exitWith {
        r_doLoop = false;
    };
    if (DZE_cancelBuilding) exitWith {
      r_doLoop = false;
    };
    sleep 0.1;
  };
  r_doLoop = false;
    
  if(!_finished) exitWith {
    _isOk = false;
    _proceed = false;
  };
  
  if(_finished) then {
		_counter = _counter + 1;
	};
  
  if(_counter == _limit) exitWith {
		_isOk = false;
		_proceed = true;
	};

};

if (_proceed) then {
  _chance = random 100;
  if (_chance >= 40) then {
    //_vehicle call compile preprocessFileLineNumbers "scripts\scrapper\parts_vehicle.sqf";
    _vehicle call compile preprocessFileLineNumbers "scripts\scrapper\parts_vehicle.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
  
  if (_toolBreak < 10) then {
  _chance = random 10;
  _toolBox = "ItemToolbox";
  _crowBar = "ItemCrowbar";
    if ( _chance > 5) then {
      player removeWeapon _toolBox;
      systemChat("You lost too many tools from your toolbox getting this job done!");
    } else {
      player removeWeapon _crowBar;
      systemChat("You broke your crowbar getting this job done!");
    };
  };
};

dayz_actionInProgress = false;
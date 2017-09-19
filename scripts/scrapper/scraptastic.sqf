private["_vehicle","_vehClass","_inventory","_obj","_objectID","_objectUID","_chopShopClasses","_maxDistance","_toolBreak"];

_vehicle = _this select 3;
_vehClass = typeOf _vehicle;
_inventory = items player;

_obj = _vehicle;
_objectID = _vehicle getVariable["ObjectID","0"];
_objectUID = _vehicle getVariable["ObjectUID","0"];

_chopShopClasses = ["Land_repair_center"]; //list of classes that you must be near in order to scrap a vehicle
_maxDistance = 50; //keeping it relatively close, id love yo make you park it in a shop but that wouldnt work so well fo airplanes and helicopters....
_chopShops = (nearestObjects [getPosATL _vehicle,_chopShopClasses,_maxDistance]);

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
      _selection = getText(configFile >> "cfgVehicles" >> _vehClass >> "HitPoints" >> _x >> "name");
      [_vehicle,_selection,(_damage + 0.2)] call fnc_veh_handleDam;
    } forEach _hitpoints;
    PVDZ_veh_Save = [_vehicle,"damage"];
    publicVariableServer "PVDZ_veh_Save";
};

//should cancel action if vehicle is occupied
if ((count (crew _vehicle)) != 0) exitWith { //I have no players or friendly AI to test this with ATM. Please confirm working or no
  systemChat("You can't scrap a vehicle while it is occupied!");
};

if !(("ItemToolbox" in _inventory) && ("ItemCrowbar" in _inventory)) exitWith {
  systemChat("You need tools to do any work!");
};

if !(count _chopShops > 0) exitWith {
  systemChat("You can't just tear down a whole vehicle out in the open, get to a Chop Shop!");
};

_toolBreak = random 100;

if (_vehClass in VRcycles) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\cycleScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRquads) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\quadScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRcars) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\carScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRtrucks) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\truckScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRapcs) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\apcScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRapvs) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\apvScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRtanks) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\tankScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRhelos) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\heliScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    call _fn_dmg_veh;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_vehClass in VRplanes) then {
  _chance = random 100;
  if (_chance >= 40) then {
    [_vehClass] ExecVM "scripts\scrapper\planeScrap.sqf";
    call _fn_del_vehicle;
    systemChat("Successfully scrapped vehicle, usable parts are in that crate!");
  } else {
    _damage = getDammage _vehicle;
    _damaged = (_damage + 0.2);
    vehicle _vehicle setDamage _damaged;
    _damage2 = getDammage _vehicle;
    systemChat("Be careful! You just damaged your vehicle!");
  };
};

if (_toolBreak < 10) then {
_chance = random 10;
_toolBox = "ItemToolbox";
_crowBar = "ItemCrowbar";
  if ( _chance > 5) then {
    player removeWeapon _toolBox;
    systemChat("You broke too many tools from your toolbox getting this job done!");
  } else {
    player removeWeapon _crowBar;
    systemChat("You broke your crowbar getting this job done!");
  };
};
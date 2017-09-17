private["_vehName","_vehClass","_inventory","_obj","_objectID","_objectUID","_chopShopClasses","_maxDistance"];

_vehName = _this select 3;
_vehClass = typeOf _vehName;
_inventory = items player;

_obj = _vehName;
_objectID = _obj getVariable["ObjectID","0"];
_objectUID = _obj getVariable["ObjectUID","0"];

_chopShopClasses = ["Land_repair_center"]; //list of classes that you must be near in order to scrap a vehicle
_maxDistance = 50; //keeping it relatively close, id love yo make you park it in a shop but that wouldnt work so well fo airplanes and helicopters....
_chopShops = (nearestObjects [getPosATL _vehName,_chopShopClasses,_maxDistance]);

_fn_del_vehicle = { //this is not my function, i personally tried to reference it from AdminTools but I could not get it to work
  PVDZ_obj_Destroy = [_objectID,_objectUID,(name player)]; //all credit for this function goes to noxSicarious/JasonTM
  publicVariableServer "PVDZ_obj_Destroy";
  if (isServer) then {
    PVDZ_obj_Destroy call server_deleteObj;
  };
  deletevehicle _obj;
};

//should cancel action if vehicle is occupied
if ((count (crew _vehName)) != 0) exitWith { //I have no players or friendly AI to test this with ATM. Please confirm working or no
  systemChat "You can't scrap a vehicle while it is occupied!";
};

if !(("ItemToolbox" in _inventory) && ("ItemCrowbar" in _inventory)) exitWith {
  systemChat ("You need tools to do any work!");
};

if !(count _chopShops > 0) exitWith {
  systemChat ("You can't just tear down a whole vehicle out in the open, get to a Chop Shop!");
};

if (_vehClass in VRcycles) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\cycleScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehClass;
    _damaged = (_damage + 0.2);
    vehicle _vehClass setDamage _damaged;
    _damage2 = getDammage _vehClass;
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRquads) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\quadScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehClass;
    _damaged = (_damage + 0.2);
    vehicle _vehClass setDamage _damaged;
    _damage2 = getDammage _vehClass;
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRcars) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\carScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehName;
    _damaged = (_damage + 0.2);
    vehicle _vehName setDamage _damaged;
    _damage2 = getDammage _vehName;
    //_vehicle setDamage [(_damaged), false];
    //_vehicle setDamage ((_damaged), false);
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRtrucks) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\truckScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehName;
    _damaged = (_damage + 0.2);
    vehicle _vehName setDamage _damaged;
    _damage2 = getDammage _vehName;
    //_vehicle setDamage [(_damaged), false];
    //_vehicle setDamage ((_damaged), false);
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRapcs) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\apcScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehName;
    _damaged = (_damage + 0.2);
    vehicle _vehName setDamage _damaged;
    _damage2 = getDammage _vehName;
    //_vehicle setDamage [(_damaged), false];
    //_vehicle setDamage ((_damaged), false);
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRapvs) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\apvScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehName;
    _damaged = (_damage + 0.2);
    vehicle _vehName setDamage _damaged;
    _damage2 = getDammage _vehName;
    //_vehicle setDamage [(_damaged), false];
    //_vehicle setDamage ((_damaged), false);
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRtanks) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\tankScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehName;
    _damaged = (_damage + 0.2);
    vehicle _vehName setDamage _damaged;
    _damage2 = getDammage _vehName;
    //_vehicle setDamage [(_damaged), false];
    //_vehicle setDamage ((_damaged), false);
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRhelos) then {
  _chance = random 100;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\heliScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
  } else {
    _damage = getDammage _vehName;
    _damaged = (_damage + 0.2);
    vehicle _vehName setDamage _damaged;
    _damage2 = getDammage _vehName;
    //_vehicle setDamage [(_damaged), false];
    //_vehicle setDamage ((_damaged), false);
    systemChat "Be careful! You just damaged your vehicle!";
  };
};

if (_vehClass in VRplanes) then {
  _c130 = "C130J_US_EP1_DZ";
  _osprey = "MV22_DZ";
  _chance = random 100;
  if (_chance >= 40) then {
    if ((_vehClass != _c130) && (_vehClass != _osprey)) then {
      ExecVM "scripts\scrapper\planeScrap.sqf";
      call _fn_del_vehicle;
      systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
    } else {
      if (_vehClass = _c130) then {
        ExecVM "scripts\scrapper\planeScrap.sqf";
        call _fn_del_vehicle;
        systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
      };
      if (_vehClass = _osprey) then {
        ExecVM "scripts\scrapper\planeScrap.sqf";
        call _fn_del_vehicle;
        systemChat "Successfully scrapped vehicle, usable parts are in that crate!";
      };
    };
  } else {
    _damage = getDammage _vehName;
    _damaged = (_damage + 0.2);
    vehicle _vehName setDamage _damaged;
    _damage2 = getDammage _vehName;
    //_vehicle setDamage [(_damaged), false];
    //_vehicle setDamage ((_damaged), false);
    systemChat "Be careful! You just damaged your vehicle!";
  };
};
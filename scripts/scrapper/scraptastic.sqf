private["_vehName","_vehClass","_inventory","_obj","_objectID","_objectUID"];

_vehName = _this select 3;
_vehClass = typeOf _vehName;
_inventory = items player;

_obj = _vehName;
_objectID = _obj getVariable["ObjectID","0"];
_objectUID = _obj getVariable["ObjectUID","0"];

_fn_del_vehicle = {
  PVDZ_obj_Destroy = [_objectID,_objectUID,(name player)];
  publicVariableServer "PVDZ_obj_Destroy";
  if (isServer) then {
    PVDZ_obj_Destroy call server_deleteObj;
  };
  deletevehicle _obj;
};

if !(("ItemToolbox" in _inventory) && ("ItemCrowbar" in _inventory)) exitWith {
  systemChat ("You need tools to do any work!");
};

if (_vehClass in VRcycles) then {
  _chance = random 39;
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
  _chance = random 39;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\quadScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, your work is in that crate!";
  } else {
    _damage = getDammage _vehClass;
    _damaged = (_damage + 0.2);
    vehicle _vehClass setDamage _damaged;
    _damage2 = getDammage _vehClass;
    systemChat "Be careful! You just damaged your vehicle!";
  };
};
if (_vehClass in VRcars) then {
  _chance = random 39;
  if (_chance >= 40) then {
    ExecVM "scripts\scrapper\carScrap.sqf";
    call _fn_del_vehicle;
    systemChat "Successfully scrapped vehicle, your work is in that crate!";
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
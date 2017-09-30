private["_type","_vehMainTur","_vehSideTur","_countMTur","_countSTur","_convertArray"];

_vehicle = _this select 0;
_toSpawnArray = _this select 1;
_type = typeOf _vehicle;

_vehMainTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "MainTurret" >> "weapons");
_vehSideTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "SideTurret" >> "weapons");
_countMTur = count _vehMainTur;
_countSTur = count _vehSideTur;
_convertArray = [];
_wepsArray = [];
_bagsArray = [];

if (_countMTur != 0) then { //if vehicle has any turrets, ones a main and this will detect that and continue else, go to end of script
  diag_log format["[SCRAPPER][WEPS] Returning list of Main Weapons on %2!! %1",_vehMainTur,_type];
  diag_log format["[SCRAPPER][WEPS] Returning list of Side Weapons on %2!! %1",_vehSideTur,_type];
  if (_countMTur > 1) then { //counting main turrets and recursively displaying them
    for "_i" from 0 to _countMTur do {
    _vehMainTur = [_vehMainTur select _i];
    _convertArray = _convertArray + [_vehMainTur];
    };
  } else {
    if (_countMTur == 1) then {
      _vehMainTur = _vehMainTur select 0;
      _convertArray = _convertArray + [_vehMainTur];
    };
  };
  if (_countSTur > 1) then {
    for "_i" from 0 to _countMTur do {
    _vehSideTur = _vehSideTur select _i;
    _convertArray = _convertArray + [_vehSideTur];
    };
  } else {
    if (_countSTur == 1) then {
      _vehSideTur = _vehSideTur select 0;
      _convertArray = _convertArray + [_vehSideTur];
    };
  };

  if !(isNil "_convertArray") then {
  _countConvert = count _convertArray;
  for "_i" from 0 to (_countConvert - 1) do {
    _convPart = _convertArray select _i;
    switch (_convPart) do {
      case "M240BC_veh"       : {_wepsArray = _wepsArray + ["M240_DZ"];};
      case "M240_veh"         : {_wepsArray = _wepsArray + ["M240_DZ"];};
      case "PKTBC"            : {_wepsArray = _wepsArray + ["PKM_DZ"];};
      case "MK19BC"           : {_bagsArray = _bagsArray + ["MK19_TriPod_US_Bag_EP1"];};
      case "MK19"             : {_bagsArray = _bagsArray + ["MK19_TriPod_US_Bag_EP1"];};
      default                   {_toSpawnArray = _toSpawnArray + ["PartGeneric"];};
      };
    };
  };
};

[_vehicle,_toSpawnArray,_wepsArray,_bagsArray] call compile preprocessFileLineNumbers "scripts\scrapper\spawnParts.sqf";
private["_type","_vehMainTur","_vehSideTur","_countMTur","_countSTur","_convertArray"];

_vehicle = _this select 0;
_toSpawnArray = _this select 1;
_type = typeOf _vehicle;

_vehMainTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "MainTurret" >> "weapons");
_vehSideTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "SideTurret" >> "weapons");
_vehBackTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "BackTurret" >> "weapons");
_vehRightTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "RightDoorGun" >> "weapons");
_vehLeftTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "LeftDoorGun" >> "weapons");
_vehFrontTur = getArray(configFile >> "cfgVehicles" >> _type >> "Turrets" >> "FrontTurret" >> "weapons");
_countMTur = count _vehMainTur;
_countSTur = count _vehSideTur;
_countBTur = count _vehBackTur;
_countRTur = count _vehRightTur;
_countLTur = count _vehLeftTur;
_countFTur = count _vehFrontTur;
_convertArray = [];
_wepsArray = [];
_bagsArray = [];

_chance = round(100 - ((random 100) / 2));
_against = (round((random 25) + ((random 100) / (random 5)));

if ((_countMTur != 0) || (_countSTur != 0) || (_countBTur != 0) || (_countRTur != 0) || (_countLTur != 0) || (_countFTur != 0)) then { //if vehicle has any turrets, this will detect that and continue else, go to end of script
  if (_countMTur > 1) then { //counting main turrets and recursively displaying them
    for "_i" from 0 to (_countMTur - 1) do {
    _vehMainTur = [_vehMainTur select _i];
    _convertArray = _convertArray + [_vehMainTur];
    };
  };
  if (_countSTur > 1) then {
    for "_i" from 0 to (_countSTur - 1) do {
    _vehSideTur = _vehSideTur select _i;
    _convertArray = _convertArray + [_vehSideTur];
    };
  };
  if (_countBTur > 1) then {
    for "_i" from 0 to (_countBTur - 1) do {
    _vehBackTur = _vehBackTur select _i;
    _convertArray = _convertArray + [_vehBackTur];
    };
  };
  if (_countRTur > 1) then {
    for "_i" from 0 to (_countRTur - 1) do {
    _vehRightTur = _vehRightTur select _i;
    _convertArray = _convertArray + [_vehRightTur];
    };
  };
  if (_countLTur > 1) then {
    for "_i" from 0 to (_countLTur - 1) do {
    _vehLeftTur = _vehLeftTur select _i;
    _convertArray = _convertArray + [_vehLeftTur];
    };
  };
  if (_countFTur > 1) then {
    for "_i" from 0 to (_countFTur - 1) do {
    _vehFrontTur = _vehFrontTur select _i;
    _convertArray = _convertArray + [_vehFrontTur];
    };
  };

  if !(isNil "_convertArray") then {
  _countConvert = count _convertArray;
  for "_i" from 0 to (_countConvert - 1) do {
    if (_chance > _against) then {
    _convPart = _convertArray select _i;
      switch (_convPart) do {
        case "M240BC_veh"                   : {_wepsArray = _wepsArray + ["M240_DZ"];};
        case "M240_veh"                     : {_wepsArray = _wepsArray + ["M240_DZ"];};
        //case "GRAD"                       : {_wepsArray = _wepsArray + ["GRAD"];};
        //case "GSh301"                     : {_wepsArray = _wepsArray + ["GSh301"];};
        //case "Ch29Launcher_Su34"          : {_wepsArray = _wepsArray + ["Ch29Launcher_Su34"];};
        //case "R73Launcher"                : {_wepsArray = _wepsArray + ["R73Launcher"];};
        //case "2A38M"                      : {_wepsArray = _wepsArray + ["2A38M"];};
        //case "2A46M"                      : {_wepsArray = _wepsArray + ["2A46M"];};
        //case "2A46MRocket"                : {_wepsArray = _wepsArray + ["2A46MRocket"];};
        //case "M242"                       : {_wepsArray = _wepsArray + ["M242"];};
        //case "M242BC"                     : {_wepsArray = _wepsArray + ["M242BC"];};
        //case "9M311Laucher"               : {_wepsArray = _wepsArray + ["9M311Laucher"];};
        //case "2A14"                       : {_wepsArray = _wepsArray + ["2A14"];};
        //case "2A42"                       : {_wepsArray = _wepsArray + ["2A42"];};
        case "2B14"                         : {_bagsArray = _bagsArray + ["2b14_82mm_TK_Bag_EP1"];};
        //case "VikhrLauncher"              : {_wepsArray = _wepsArray + ["VikhrLauncher"];};
        //case "80mmLauncher"               : {_wepsArray = _wepsArray + ["80mmLauncher"];};
        //case "2B14"                       : {_wepsArray = _wepsArray + ["2B14"];};
        case "M252"                         : {_bagsArray = _bagsArray + ["M252_US_Bag_EP1"];};
        //case "M120"                       : {_wepsArray = _wepsArray + ["M120"];};
        //case "MLRS"                       : {_wepsArray = _wepsArray + ["MLRS"];};
        //case "M256"                       : {_wepsArray = _wepsArray + ["M256"];};
        //case "DShKM"                      : {_wepsArray = _wepsArray + ["DShKM"];};
        //case "BAF_L2A1"                   : {_wepsArray = _wepsArray + ["BAF_L2A1"];};
        //case "BAF_L7A2"                   : {_wepsArray = _wepsArray + ["BAF_L7A2"];};
        //case "BAF_static_GMG"             : {_wepsArray = _wepsArray + ["BAF_static_GMG"];};
        case "BAF_M240_veh"                 : {_wepsArray = _wepsArray + ["M240_DZ"];};
        case "BAF_M240_veh_2"               : {_wepsArray = _wepsArray + ["M240_DZ"];};
        //case "M3P"                        : {_wepsArray = _wepsArray + ["M3P"];};
        //case "KPVT"                       : {_wepsArray = _wepsArray + ["KPVT"];};
        case "KORD"                         : {_bagsArray = _bagsArray + ["KORD_TK_Bag_EP1"];};
        case "M2"                           : {_bagsArray = _bagsArray + ["M2StaticMG_US_Bag_EP1"];};
        //case "M134"                       : {_wepsArray = _wepsArray + ["M134"];};
        //case "M134_2"                     : {_wepsArray = _wepsArray + ["M134_2"];};
        //case "M68"                        : {_wepsArray = _wepsArray + ["M68"];};
        //case "M230"                       : {_wepsArray = _wepsArray + ["M230"];};
        //case "CRV7_HEPD"                  : {_wepsArray = _wepsArray + ["CRV7_HEPD"];};
        //case "CRV7_FAT"                   : {_wepsArray = _wepsArray + ["CRV7_FAT"];};
        //case "M2BC"                       : {_wepsArray = _wepsArray + ["M2BC"];};
        //case "M32_heli"                   : {_wepsArray = _wepsArray + ["M32_heli"];};
        //case "M119"                       : {_wepsArray = _wepsArray + ["M119"];};
        case "AGS30"                        : {_bagsArray = _bagsArray + ["AGS_TK_Bag_EP1"];};
        //case "AGS17"                      : {_wepsArray = _wepsArray + ["AGS17"];};
        //case "D30"                        : {_wepsArray = _wepsArray + ["D30"];};
        //case "AT2Launcher"                : {_wepsArray = _wepsArray + ["AT2Launcher"];};
        //case "57mmLauncher_128"           : {_wepsArray = _wepsArray + ["57mmLauncher_128"];};
        //case "D81"                        : {_wepsArray = _wepsArray + ["D81"];};
        //case "D10"                        : {_wepsArray = _wepsArray + ["D10"];};
        //case "SGMT"                       : {_wepsArray = _wepsArray + ["SGMT"];};
        //case "YakB"                       : {_wepsArray = _wepsArray + ["YakB"];};
        //case "CTWS"                       : {_wepsArray = _wepsArray + ["CTWS"];};
        //case "AT6Launcher"                : {_wepsArray = _wepsArray + ["AT6Launcher"];};
        //case "S8Launcher"                 : {_wepsArray = _wepsArray + ["S8Launcher"];};
        //case "SPG9"                       : {_wepsArray = _wepsArray + ["SPG9"];};
        //case "GSh302"                     : {_wepsArray = _wepsArray + ["GSh302"];};
        //case "AT9Launcher"                : {_wepsArray = _wepsArray + ["AT9Launcher"];};
        //case "HeliBombLauncher"           : {_wepsArray = _wepsArray + ["HeliBombLauncher"];};
        //case "80mmLauncher"               : {_wepsArray = _wepsArray + ["80mmLauncher"];};
        //case "2A72"                       : {_wepsArray = _wepsArray + ["2A72"];};
        //case "2A70"                       : {_wepsArray = _wepsArray + ["2A70"];};
        //case "ZiS_S_53"                   : {_wepsArray = _wepsArray + ["ZiS_S_53"];};
        //case "DT_veh"                     : {_wepsArray = _wepsArray + ["DT_veh"];};
        //case "2A70Rocket"                 : {_wepsArray = _wepsArray + ["2A70Rocket"];};
        case "SEARCHLIGHT"                  : {_wepsArray = _wepsArray + ["ItemLightBulb"];};
        //case "AT13LauncherSingle"         : {_wepsArray = _wepsArray + ["AT13LauncherSingle"];};
        //case "AT5LauncherSingle"          : {_wepsArray = _wepsArray + ["AT5LauncherSingle"];};
        //case "AT5Launcher"                : {_wepsArray = _wepsArray + ["AT5Launcher"];};
        case "TOWLauncherSingle"            : {_bagsArray = _bagsArray + ["TOW_TriPod_US_Bag_EP1"];};
        case "TOWLauncher"                  : {_bagsArray = _bagsArray + ["TOW_TriPod_US_Bag_EP1"];};
        case "M197"                         : {_bagsArray = _bagsArray + ["M2StaticMG_US_Bag_EP1"];};
        //case "HellfireLauncher"           : {_wepsArray = _wepsArray + ["HellfireLauncher"];};
        //case "Laserdesignator_mounted"    : {_wepsArray = _wepsArray + ["Laserdesignator_mounted"];};
        //case "FFARLauncher"               : {_wepsArray = _wepsArray + ["FFARLauncher"];};
        //case "SidewinderLaucher_AH1Z"     : {_wepsArray = _wepsArray + ["SidewinderLaucher_AH1Z"];};
        //case "SidewinderLaucher_AH64"     : {_wepsArray = _wepsArray + ["SidewinderLaucher_AH64"];};
        case "PKT"                          : {_wepsArray = _wepsArray + ["PKM_DZ"];};
        case "PKT_2"                        : {_wepsArray = _wepsArray + ["PKM_DZ"];};
        case "PKT_3"                        : {_wepsArray = _wepsArray + ["PKM_DZ"];};
        case "PKTBC"                        : {_wepsArray = _wepsArray + ["PKM_DZ"];};
        case "PKT_veh"                      : {_wepsArray = _wepsArray + ["PKM_DZ"];};
        case "PKT_high_AI_dispersion"       : {_wepsArray = _wepsArray + ["PKM_DZ"];};
        case "MK19"                         : {_bagsArray = _bagsArray + ["MK19_TriPod_US_Bag_EP1"];};
        case "MK19BC"                       : {_bagsArray = _bagsArray + ["MK19_TriPod_US_Bag_EP1"];};
        case "BAF_GMG"                      : {_bagsArray = _bagsArray + ["MK19_TriPod_US_Bag_EP1"];};
        case "StingerLaucher"               : {_wepsArray = _wepsArray + ["Stinger"];};
        case "StingerLaucher_4x"            : {_wepsArray = _wepsArray + ["Stinger","Stinger","Stinger","Stinger"];};
        default                               {_toSpawnArray = _toSpawnArray + ["PartGeneric"];};
        };
      } else {
        systemChat ("You broke the weapon trying to get it off!!");
        _toSpawnArray = _toSpawnArray + ["PartGeneric"];
      };
    };
  };
};

[_vehicle,_toSpawnArray,_wepsArray,_bagsArray] call compile preprocessFileLineNumbers "scripts\scrapper\spawnParts.sqf";
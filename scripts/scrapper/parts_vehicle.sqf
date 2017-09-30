private ["_part","_hitpoints","_isBicycle","_isATV","_is6WheelType","_is8WheelType","_HasNoGlassKind","_hitpoint",
"_6WheelTypeArray","_8WheelTypeArray","_NoGlassArray","_NoExtraWheelsArray","_nullPartsArray","_RemovedPartsArray","_damage","_configVeh","_type"];

_vehicle = _this;

_hitpoints = _vehicle call vehicle_getHitpoints;

_type = typeOf _vehicle;
_isBicycle = _type in ["M1030_US_DES_EP1","MMT_Civ","MMT_USMC","Old_bike_TK_INS_EP1"];
_isATV = _type in ["ATV_US_EP1","ATV_CZ_EP1","BAF_ATV_D","BAF_ATV_W"];
_is6WheelType = false;
_is8WheelType = false;
_isPlane = false;
{if (_type isKindOf _x) exitWith {_is6WheelType = true;};} count ["Kamaz_Base","MTVR","Ural_Base","Ural_Base_withTurret","V3S_Base"];
{if (_type isKindOf _x) exitWith {_is8WheelType = true;};} count ["BTR90_Base","LAV25_Base"];
{if (_type isKindOf "Plane") exitWith {_isPlane = true;};};
_HasNoGlassKind = (_vehicle isKindOf "Motorcycle");

_6WheelTypeArray = ["HitLMWheel","HitRMWheel"];
_8WheelTypeArray = ["HitLf2Wheel","HitRf2Wheel","HitLMWheel","HitRMWheel"];
_NoGlassArray = ["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitLGlass","HitRGlass"];
_TooMuchGlassArray = ["HitGlass9","HitGlass10","HitGlass11","HitGlass12","HitGlass13","HitGlass14","HitGlass15","HitGlass16","HitGlass17","HitGlass18","HitGlass19","HitGlass20"];
_NoExtraWheelsArray = ["wheel_1_4_steering","wheel_2_4_steering","wheel_1_3_steering","wheel_2_3_steering"];
_nullPartsArray = ["HitVRotor","HitMissiles","HitHull","HitBody"];

_hitpoints = _hitpoints - [_NoExtraWheelsArray,_TooMuchGlassArray];
_toSpawnArray = ["PartGeneric"];

if !(isNil "_hitpoints") then { //verifies we have initialized a vehicle, then removes some of the excess crap
  if !(_is6WheelType || _is8WheelType) then {
    _RemovedPartsArray = ["HitLF2Wheel","HitRF2Wheel","HitLMWheel","HitRMWheel"];
  } else {
    _RemovedPartsArray = [];
  };
  if (_isATV || _HasNoGlassKind) then {
    _hitpoints = _hitpoints - _NoGlassArray;
  };
  if (_isBicycle) then {
    _hitpoints = []; //need to empty the list on a bicycle, currently would contain motor, tires, fuelparts etc. itll get a custom array once in the spawn script
  };
  if (_is6WheelType) then { //array stops mtvr's etc from chancing 8 wheels to spawn
    _RemovedPartsArray = _RemovedPartsArray + ["HitLF2Wheel","HitRF2Wheel"];
  };
  /*if (_isPlane) then {
    _toSpawnArray = _toSpawnArray + ["PartEngine","PartEngine"];
  };*/
};

{
	_hitpoint = _x;
	_damage = [_vehicle,_x] call object_getHit;
  _damVar = round(ceil(_damage *100)); //converts damage into a whole integer since damage works 0 = destroyed, 1 = perfect, damage is handled as subnumber 0.123 will now be  12% damage
  _chance = round(100 - (_damVar / 2)); //chance to spawn part with damage reflected as a negative factor
  _against = (round((random 25) + _damVar)); //the roll against the part for it to not spawn. chance has to be greater than this to spawn. if part has suffered 75% damage IT WILL NOT have a chance and will instead turn into scrap

	if !(_x in _RemovedPartsArray) then {

		_configVeh = configFile >> "cfgVehicles" >> "RepairParts" >> _x;
		_part = getText(_configVeh >> "part");

		if (_x in _nullPartsArray) then { //some parts in the config file dont match up to a part, here we are overriding what they return as
      _amount = round((100 - _damVar) / 20); //this is for converting HitHull/HitBody into scrap metal based on damage. will return 0 - 5 based on damage. every 20% reduces it by 1
      _rand = round(random _amount); //after getting possible amount to turn hull into scrap, a random number from that amount is selected and added
      switch (_x) do {
        case "HitVRotor"    : {_part = "PartVRotor"}; //HitHRotor is what actually turns into a rotor part even tho its called a PartVRotor which doesnt come from HitVRotor???? the hell? FIX
        case "HitMissiles"  : {_part = "equip_scrapelectronics"}; //original experiment for turning HitMissiles into something usable since it seems this component is on all helis
        case "HitHull"      : {for "_i" from 0 to _rand do {_toSpawnArray = _toSpawnArray + ["PartGeneric"]; };};
        case "HitBody"      : {for "_i" from 0 to _rand do {_toSpawnArray = _toSpawnArray + ["PartGeneric"]; };};
      };
    };

    if (_chance > _against) then { // this is where the chance rolls come into play. if part is successfully rolled, it gets added to the array that we will execute the spawn script from
      _toSpawnArray = _toSpawnArray + [_part]; //success adds part.
    } else {
      _toSpawnArray = _toSpawnArray + ["PartGeneric"]; //failure adds scrap. 
    };
	};
} forEach _hitpoints;

[_vehicle,_toSpawnArray] call compile preprocessFileLineNumbers "scripts\scrapper\weapon_Parts.sqf"; //executing spawn script with parts array for dynamic part spawning! that script is where we will add some special edits and spawns
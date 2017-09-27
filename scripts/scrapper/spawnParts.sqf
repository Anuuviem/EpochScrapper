private["_vehicle","_type","_partsArray","_player","_dir","_pos","_spawnCrate","_first"];

_vehicle = _this select 0;
_type = typeOf _vehicle;
_partsArray = _this select 1;

_player = player;

_classname = "USOrdnanceBox";

_dir = getdir _player;
_pos = getposATL _player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

_spawnCrate = _classname createVehicleLocal _pos;	
_spawnCrate setDir _dir;
_spawnCrate setposATL _pos;

clearWeaponCargoGlobal _spawnCrate;
clearMagazineCargoGlobal _spawnCrate;
clearBackpackCargoGlobal _spawnCrate;

if (_type isKindOf "Bicycle") then {
  _partsArray = _partsArray + ["equip_1inch_metal_pipe","equip_2inch_metal_pipe"];
};

if (_type isKindOf "Tank") then {
  _rand = random 10;
  _rand2 = random 50;
  for "_i" from 0 to _rand do {if (_rand2 > 25) then {_partsArray = _partsArray + ["equip_metal_sheet"];};};
};

if (_type == "c130J_US_EP1_DZ") then {
  _rand = (random 15) + 5;
  for _i from 0 to _rand do { _partsArray = _partsArray + ["PartGeneric"];};
};

_parts = count _partsArray;
_first = 0;

for "_i" from 0 to _parts do { _spawncrate addMagazineCargoGlobal [(_partsArray select _first),1]; _first = _first + 1; }; //incomplete, need to figure out how to do this code foreach item in _partsArray
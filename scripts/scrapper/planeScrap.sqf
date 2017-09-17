private["_dir","_pos","_spawnCrate","_randFlip","_randLow","_randMid","_player","_type"];

// array to fill because of stupid workaround
_VRTruckParts = [["PartGeneric","1"],["PartEngine","1"],["PartFueltank","1"],["PartVRotor","0"];

//containers for our random vars so we can insert into an array as whole figure for that effin workaround
_randFlip = floor(random 2);
_randLow = floor((random 8)/2);
_randMid = floor(random 15);

//setting the number of each part to add
_VRTruckParts select 0 set [1,_randMid];
_VRTruckParts select 1 set [1,_randLow];
_VRTruckParts select 2 set [1,_randLow];
_VRTruckParts select 2 set [1,_randFlip];

_player = player;

// Name of this crate
_crateName = "Scrap Crate";

// Crate type. Possibilities: MedBox0, FoodBox0, BAF_BasicWeapons, USSpecialWeaponsBox, USSpecialWeapons_EP1, USVehicleBox, RUSpecialWeaponsBox, RUVehicleBox, etc.
_classname = "USOrdnanceBox";

// Location of player and crate
_dir = getdir _player;
_pos = getposATL _player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

//actually spawn the crate
_spawnCrate = _classname createVehicleLocal _pos;	
_spawnCrate setDir _dir;
_spawnCrate setposATL _pos;

_type = _this select 0; //in theory this should be the classname of the _vehClass that triggered this script to execute. Using it to determine if osprey or c130

//clear crate before filling it
clearWeaponCargoGlobal _spawnCrate;
clearMagazineCargoGlobal _spawnCrate;
clearBackpackCargoGlobal _spawnCrate;

//fill it with this crap. freaking workaround looks terribly ugly and prolly slow as crap but wont populate if structured ["PartGeneric", (0 + floor(random 3))];
if (_type = "C130J_US_EP1_DZ") then {
  _spawnCrate addMagazineCargoGlobal [(_VRTruckParts select 0) select 0, (((_VRTruckParts select 0) select 1) + 10)]; //give c130's a massive amount of scrap metal
} else {
  _spawnCrate addMagazineCargoGlobal [(_VRTruckParts select 0) select 0, (_VRTruckParts select 0) select 1];
  };
_spawnCrate addMagazineCargoGlobal [(_VRTruckParts select 1) select 0, (_VRTruckParts select 1) select 1];
_spawnCrate addMagazineCargoGlobal [(_VRTruckParts select 2) select 0, (_VRTruckParts select 2) select 1];
if (_type = "MV22_DZ") then {
  _spawnCrate addMagazineCargoGlobal [(_VRTruckParts select 3) select 0, (_VRTruckParts select 2) select 1];
};
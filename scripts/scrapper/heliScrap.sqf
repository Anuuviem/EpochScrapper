private["_dir","_pos","_spawnCrate","_randFlip","_randLow","_randMid","_player"];

// array to fill because of stupid workaround
_VRHeliParts = [["PartGeneric","1"],["PartEngine","1"],["PartFueltank","1"],["PartVRotor","1"];

//containers for our random vars so we can insert into an array as whole figure for that effin workaround
_ranFlip = floor(random 2);
_randLow = floor((random 7)/2);
_randMid = floor(random 12);

//setting the number of each part to add
_VRHeliParts select 0 set [1,_randMid];
_VRHeliParts select 1 set [1,_randLow];
_VRHeliParts select 2 set [1,_randLow];
_VRHeliParts select 3 set [1,_randFlip];

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


//clear crate before filling it
clearWeaponCargoGlobal _spawnCrate;
clearMagazineCargoGlobal _spawnCrate;
clearBackpackCargoGlobal _spawnCrate;

//fill it with this crap. freaking workaround looks terribly ugly and prolly slow as crap but wont populate if structured ["PartGeneric", (0 + floor(random 3))];
_spawnCrate addMagazineCargoGlobal [(_VRHeliParts select 0) select 0, (_VRHeliParts select 0) select 1];
_spawnCrate addMagazineCargoGlobal [(_VRHeliParts select 1) select 0, (_VRHeliParts select 1) select 1];
_spawnCrate addMagazineCargoGlobal [(_VRHeliParts select 2) select 0, (_VRHeliParts select 2) select 1];
_spawnCrate addMagazineCargoGlobal [(_VRHeliParts select 3) select 0, (_VRHeliParts select 3) select 1];
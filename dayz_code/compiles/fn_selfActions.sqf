	//VR's Scraptastic script
  if ((_typeOfCursorTarget in VRtargets) && (_isAlive) && (!_isLocked) && (!_inVehicle)) then { //hopefully !_inVehicle will prevent scrapping while vehicle is occupied by anyone
    _typeOfCursorTarget = _cursorTarget;
    if (s_scrap_dat < 0) then {
      s_scrap_dat = player addAction [("<t color=""#FF0000"">"+("Scrap It") + "</t>"),"scripts\scrapper\scraptastic.sqf",_cursorTarget, 0, true, true];
    };
  } else {
    player removeAction s_scrap_dat;
    s_scrap_dat = -1;
  };
  
  player removeAction s_scrap_dat; //VRs scraptastic
  s_scrap_dat = -1;
  
  
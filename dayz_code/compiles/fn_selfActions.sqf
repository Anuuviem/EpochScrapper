	//VR's Scraptastic script
  if (_isVehicle && {!_isMan} && {_hasToolbox} && {_hasCrowbar} && {_isAlive} && {!_isLocked}) then {
    if (s_scrap_dat < 0) then {
      s_scrap_dat = player addAction [("<t color=""#FF0000"">"+("Scrap It") + "</t>"),"scripts\scrapper\scraptastic.sqf",_cursorTarget, 0, true, true];
    };
  } else {
    player removeAction s_scrap_dat;
    s_scrap_dat = -1;
  };
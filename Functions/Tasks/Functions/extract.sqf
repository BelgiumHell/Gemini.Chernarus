_location = getPos officer;
_location = [_location,0,0,1,[1,50]] call Zen_FindGroundPosition;


_startLoc = getMarkerPos "mrk_heliSpawn";


_marker = createMarker ["test", _startLoc];   
"test" setMarkerType "hd_objective";   
"test" setMarkerColor "ColorOPFOR";

Sleep 60;

_heliA1 = [_startLoc,casPool,0] call Zen_SpawnHelicopter;
_startLoc = [_startLoc,50,100] call Zen_ExtendPosition;
_heliT = [_startLoc,airPool,0] call Zen_SpawnHelicopter;
_startLoc = [_startLoc,50,100] call Zen_ExtendPosition;
_heliA2 = [_startLoc,casPool,0] call Zen_SpawnHelicopter;
	
[(group _heliA1),_location] call BIS_fnc_taskAttack;
Sleep 15;

_locationE = [_location,0,0,1,[1,700]] call Zen_FindGroundPosition;
_locEnd = getMarkerPos "mrk_end";

[_heliT,[_locationE,_locEnd],officer] spawn Zen_OrderExtraction;

_heliA2 joinSilent (group _heliT);

Sleep 15;

[(group _heliA2),_location] call BIS_fnc_taskAttack;
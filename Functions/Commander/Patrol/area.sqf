/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_group","_pos","_radius","_behaviour"];

if(!local _group)exitWith{};

_group setBehaviour _behaviour;
_group setSpeedMode "LIMITED";
_wp = _group addWaypoint [_pos, _radius];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour _behaviour;
_code = format["[group this,%1,%2,""%3""]call JOC_cmdPatrolArea;",_pos,_radius,_behaviour];
_wp setWaypointStatements ["local this", _code];
_wp setWaypointCompletionRadius 10;
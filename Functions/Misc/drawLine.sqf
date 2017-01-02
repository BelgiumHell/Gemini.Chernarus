params["_point1","_point2","_color","_thickness"];

_distance = _point1 distance2D _point2;
_middle = [((_point1 select 0) + (_point2 select 0))/2 , ((_point1 select 1) + (_point2 select 1))/2];
_dir = ([_point1, _point2] call BIS_fnc_dirTo) + 90;

_marker = [_middle,"",_color,[_distance/2,_thickness],"RECTANGLE",_dir]call Zen_SpawnMarker;
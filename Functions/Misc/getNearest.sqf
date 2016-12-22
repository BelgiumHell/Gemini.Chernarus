params["_pos","_objects"];

_nearest = objNull;
_prevDis = 99999;
{
	if(_pos distance2D _x < _prevDis)then{
		_prevDis = _pos distance2D _x;
		_nearest = _x;
	};
} forEach _objects;

_nearest
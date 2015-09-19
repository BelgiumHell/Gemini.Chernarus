/////////////////////////
//Script made by Jochem//
/////////////////////////
_array = [];

//Towns
{
	_arrayN = [
		(getPos _x),
		{"mrk_task_text" setMarkerText format["Current objective: clear out %1",_this select 2];},
		text _x,
		format["Clear out %1",(text _x)],
		"",
		"",
		1,
		[]
	];

	_array = _array + [_arrayN];
}forEach opTowns;

//Airfields
{
	if(!(airfieldOccup select _forEachIndex))then{
		_arrayN = [
			(getMarkerPos _x),
			{"mrk_task_text" setMarkerText format["Current objective: clear out %1",_this select 2];},
			"Airfield",
			"Clear out airfield",
			"",
			"",
			1,
			[]
		];
		_array = _array + [_arrayN];
	};

} forEach airfieldMarkers;

_array

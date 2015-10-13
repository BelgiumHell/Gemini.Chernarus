/////////////////////////
//Script made by Jochem//
/////////////////////////
_array = [];

_baseLoc = [];
{
    if(getMarkerColor _x != "")then{
        _baseLoc pushBack (getMarkerPos _x);
    };
} forEach baseMarkersO;

_townLoc = [];
{
    _townLoc pushBack (position _x);
} forEach opTowns;


{
	_arrayN = [
		_x,
		{player setPos (_this select 0);},
		"Spawn here",
		"Choose this as your respawn point",
		"",
		"",
		1,
		[]
	];

	_array = _array + [_arrayN];
}forEach (_baseLoc + _townLoc);

_array

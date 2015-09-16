/////////////////////////
//Script made by Jochem//
/////////////////////////
_array = [];

{
	_arrayN = [
		(getPos _x),
		{player setPos (_this select 0)},
		"FOB",
		"Relocate here",
		"",
		"",
		1,
		[]
	];

	_array = _array + [_arrayN];
}forEach fobTrucks;

_array = _array +  [[
	(getPos respawn_obj),
	{player setPos getPos respawn_obj},
	"Base",
	"Relocate here",
	"",
	"",
	1,
	[]
]];

_array

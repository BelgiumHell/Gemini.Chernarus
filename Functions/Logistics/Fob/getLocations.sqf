/////////////////////////
//Script made by Jochem//
/////////////////////////
_array = [];

{
	_pos = [(getPos _x),3,((direction _x) + 90)] call Zen_ExtendPosition;
	if(locked _x != 0 and locked _x != 1)then{
		_arrayN = [
			_pos,
			{player setPos (_this select 0);},
			"FOB",
			"Relocate here",
			"",
			"",
			1,
			[]
		];

		_array = _array + [_arrayN];
	};
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

/////////////////////////
//Script made by Jochem//
/////////////////////////
_startloc = [1000,1000,0];
_hor = 8;
_vert = 8;

cacheTriggers =[];
_trgA0 = [];
_trgA1 = [];
_trgA2 = [];
_trgA3 = [];
_trgA4 = [];
_trgA5 = [];
_trgA6 = [];
_trgA7 = [];

cacheTriggers = [
_trgA0,
_trgA1,
_trgA2,
_trgA3,
_trgA4,
_trgA5,
_trgA6,
_trgA7
];

_xA = 0;
_yA = 0;
_location = _startloc;
while {_xA < _hor}do{
	while {_yA < _vert}do{
		_array = cacheTriggers select _xA;
		_trg = createTrigger ["EmptyDetector",_location,true];
  	 	_trg setTriggerArea [4000,4000,4000,true];
 	    _trg setTriggerActivation ["WEST","PRESENT", true];
  		_trg setTriggerStatements ["this","[getPos thisTrigger] spawn JOC_unCache","[getPos thisTrigger] spawn JOC_cache"];
		_trg setTriggerTimeout [5,5,5,true];
		[_array, _yA, _trg] call Zen_ArrayInsert;

		_yA = _yA + 1;
		_location = [_location,2000,0] call Zen_ExtendPosition;
	};
	_yA = 0;
	_xA = _xA + 1;
	_location = [_startLoc,(_xA * 2000),90] call Zen_ExtendPosition;
};

cacheGroup = createGroup east;
cachedGroups = [];
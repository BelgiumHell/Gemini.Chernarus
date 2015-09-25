/////////////////////////
//Script made by Jochem//
/////////////////////////
_startloc = [1000,1000,0];
//_hor = 8;
//_vert = 8;
_hor = worldSize / 2000;
_vert = worldSize / 2000;

_xA = 0;
_yA = 0;
_location = _startloc;
while {_xA < _hor}do{
	while {_yA < _vert}do{
		_trg = createTrigger ["EmptyDetector",_location,true];
  	 	_trg setTriggerArea [4000,4000,4000,true];
 	    _trg setTriggerActivation ["WEST","PRESENT", true];
  		_trg setTriggerStatements ["this","[getPos thisTrigger] spawn JOC_unCache","[getPos thisTrigger] spawn JOC_cache"];
		_trg setTriggerTimeout [5,5,5,true];

		_yA = _yA + 1;
		_location = [_location,2000,0] call Zen_ExtendPosition;
	};
	_yA = 0;
	_xA = _xA + 1;
	_location = [_startLoc,(_xA * 2000),90] call Zen_ExtendPosition;
};

cacheGroup = createGroup east;
[cacheGroupLeader] joinSilent cacheGroup;
cacheGroup selectLeader cacheGroupLeader;
cachedGroups = [];

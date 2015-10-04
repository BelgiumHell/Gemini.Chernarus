/////////////////////////
//Script made by Jochem//
/////////////////////////
if(baseCount == -1)then{
    baseCount = 999;
};

_bases = [];
_ok = 0;
_count = 0;
while {_ok == 0} do {
    _base = format ["mrk_compound_%1",_count];
    if(getMarkerColor _base == "")then{
		_ok = 1;
	}else{
        _bases pushback _base;
        _count = _count + 1;
	};
};

_basesR = [_bases, (count _bases)]call Zen_ArrayGetRandomSequence;

_s = 0;
while {_s < baseCount} do {
    _baseMark = _basesR select _s;

    if(isNil{_baseMark})exitWith{};

    _location = getMarkerPos _baseMark;

    _trg = createTrigger ["EmptyDetector",_location,true];
    _trg setTriggerArea [900,900,900,false];
    _trg setTriggerActivation ["WEST","PRESENT", false];
    _trg setTriggerStatements ["this","[getPos thisTrigger] call JOC_spawnBase;deleteVehicle thisTrigger;",""];
    _trg setTriggerTimeout [5,5,5,true];

	//Create marker
    _name = [7] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_hq";
    _name setMarkerSize [0.65, 0.65];

    baseMarkers pushback _name;

	_s = _s + 1;
};

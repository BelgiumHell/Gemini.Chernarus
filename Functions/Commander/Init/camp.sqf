/////////////////////////
//Script made by Jochem//
/////////////////////////
_camp = 0;
_location = [];
while {_camp < 40} do{
	_location = [];
    _isFlat = [];
	while{count _location == 0}do{
		_pos = ["mrk_area",0,[blackMarkers + airfieldMarkers,[],[]],1,0] call Zen_FindGroundPosition;
		_location  = _pos findEmptyPosition [0,300,emptyClass];
	};

    [_location]call Zen_SpawnCamp;

	_nameS = format ["mrk_strategic_camp_%1",_camp];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,50,"camp",_nameS,east];

	_camp = _camp + 1;
};

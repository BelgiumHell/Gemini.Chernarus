/////////////////////////
//Script made by Jochem//
/////////////////////////
_camp = 0;
_location = [];
while {_camp < 40} do{
	_location = ["mrk_area",0,[blackMarkers + airfieldMarkers,[],[]],1,0,[0,360],[1,0,5],[0,0,0],[1,100],[1,10,5],[1,[0,0,0],5]] call Zen_FindGroundPosition;

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

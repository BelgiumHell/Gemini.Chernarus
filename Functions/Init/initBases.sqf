/////////////////////////
//Script made by Jochem//
/////////////////////////

_s = 0;
while {_s < baseCount} do {
    _compS = [_comp1,_comp2,_comp3,_comp4,_comp5,_comp6,_comp7,_comp8] call BIS_fnc_selectRandom;

	//Get position
	//_location = [0,0,[airfieldMarkers + blackMarkers,["mrk_area"],[]],1,0,0,0,0,0,[1,10,50],[1,0,60]] call Zen_FindGroundPosition;
	_location = position player;

	//Spawn Composition
	[_compS,_location] call JOC_spawnComposition;

	//Create marker
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_hq";

	_s = _s + 1;
};

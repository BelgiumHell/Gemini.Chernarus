/////////////////////////
//Script made by Jochem//
/////////////////////////
_s = 0;
while{_s < 80}do{
    _location = [0,0,airfieldMarkers + blackMarkers,1,[1,1400]] call Zen_FindGroundPosition;

    _name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "Minefield";
	_name setMarkerSize [0.65, 0.65];

    _mine = createMine ["ATMine", _location, [], 0];
    east revealMine _mine;

    _j = 0;
    while{_j < 15}do{
        _mine = createMine ["APERSBoundingMine", _location, [], 75];
        east revealMine _mine;
        _j = _j + 1;
    };
    _s = _s + 1;
};

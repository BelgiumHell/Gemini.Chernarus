/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_location"];

_j = 0;
_location = [0,0,airfieldMarkers,1,[1,1400]] call Zen_FindGroundPosition;

_mine = createMine ["ATMine", _location, [], 0];
zeusMod addCuratorEditableObjects [[_mine],false];
east revealMine _mine;

while{_j < 15}do{
	_mine = createMine ["APERSBoundingMine", _location, [], 75];
	zeusMod addCuratorEditableObjects [[_mine],false];
    east revealMine _mine;
   	_j = _j + 1;
};
/////////////////////////
//Script made by Jochem//
/////////////////////////
{
	_curator = _x;
	_curator addCuratorEditableObjects [(allUnits - [cacheGroupLeader]),false];
	_curator addCuratorEditableObjects [allDead,false];
	_curator addCuratorEditableObjects [allMines,false];

	_obj = ((nearestObjects [(getMarkerPos "mrk_area"), ["All"], (worldSize*2^0.5)]) - baseObjects);
	_curator addCuratorEditableObjects [_obj,false];
}forEach allCurators;

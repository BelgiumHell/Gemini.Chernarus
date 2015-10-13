/////////////////////////
//Script made by Jochem//
/////////////////////////
_towers = nearestObjects [getMarkerPos "mrk_area",["Land_TTowerBig_1_F","Land_TTowerBig_2_F"],worldSize*2.0^0.5];

{
	[_x]spawn JOC_radioTower;
} forEach _towers;

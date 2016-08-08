/////////////////////////
//Script made by Jochem//
/////////////////////////
_roofBuildings = (nearestObjects [(getMarkerPos "mrk_area"),roofPool,worldSize*2.0^0.5])call BIS_fnc_arrayShuffle;

_i = 0;
while{_i < (count _roofBuildings) * 0.6}do{
    _building = _roofBuildings select _i;
    _posArr = _building buildingPos -1;
    _static = createVehicle [selectRandom staticPoolAA,_posArr select (count _posArr - 1), [], 0, "CAN_COLLIDE"];
    createVehicleCrew _static;
    [group _static]call JOC_virtualize;
    createVehicleCrew _static;
    _i = _i + 1;
};
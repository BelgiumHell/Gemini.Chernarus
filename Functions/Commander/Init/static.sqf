/////////////////////////
//Script made by Jochem//
/////////////////////////
_roofBuildings = (nearestObjects [(getMarkerPos "mrk_area"),roofPool,worldSize*2.0^0.5])call BIS_fnc_arrayShuffle;

_i = 0;
while{_i < (count _roofBuildings) * 0.75}do{
    _building = _roofBuildings select _i;
    _posArr = _building buildingPos -1;
    _static = createVehicle [selectRandom staticPoolAA,_posArr select (count _posArr - 1), [], 0, "CAN_COLLIDE"];
    _static setPosATL (_posArr select (count _posArr - 1));
    createVehicleCrew _static;
    [group ((crew _static) select 0)]call JOC_virtualize;
    _i = _i + 1;
};
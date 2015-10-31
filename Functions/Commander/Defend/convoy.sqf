/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_targetP","_startP","_count"];

_truckCount = _count select 0;
_apcCount = _count select 1;

_x = 0;
//cars
while{_x < _truckCount} do{
    _locationS = [_startP,[0,400],0,1,[1,400]] call Zen_FindGroundPosition;
    _veh = [_locationS,(truckPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    [_veh,east] call Zen_SpawnVehicleCrew;
    _count = (_veh emptyPositions "cargo") - 2;
	_group = [_locationS, east, "infantry", _count,"Basic"] call Zen_SpawnInfantry;
    [_group,_veh] call Zen_MoveInVehicle;
    [_veh, _targetP,300,[0,360],"full"] spawn Zen_OrderVehiclePatrol;
	_veh setDamage 0;
    _x = _x + 1;
};

_x = 0;
//APC
while{_x < _apcCount} do{
    _locationS = [_startP,[0,400],0,1,[1,400]] call Zen_FindGroundPosition;
    _veh = [_locationS,(apcPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    [_veh,east] call Zen_SpawnVehicleCrew;
    _count = (_veh emptyPositions "cargo");
	_group = [_locationS, east, "infantry", _count,"Basic"] call Zen_SpawnInfantry;
    [_group,_veh] call Zen_MoveInVehicle;
    [_veh, _targetP,300,[0,360],"full"] spawn Zen_OrderVehiclePatrol;
	_veh setDamage 0;
    _x = _x + 1;
};

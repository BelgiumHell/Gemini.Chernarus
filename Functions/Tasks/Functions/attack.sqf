/////////////////////////
//Script made by Jochem//
/////////////////////////
_location = position uav;

//Spawn enemies
_groupCount = 6;
_lightCount = 3;
    
//Get spawn location
_locationSpawn = [_location,[1800,2000],["mrk_safeZone"]] call Zen_FindGroundPosition;
    
_x = 0;
//infantry
while{_x < _groupCount} do{
    _locationS = [_locationSpawn, random 10, random 10] call BIS_fnc_relPos;
    _locationS = [_locationS,1,1] call Zen_ExtendPosition;
    _group = [_locationS, east, "infantry", 5,"Basic"] call Zen_SpawnInfantry;
    [_group,_location,[0,300],[0,360],"full"] spawn Zen_OrderInfantryPatrol;
    _x = _x + 1;
};

_x = 0;

//IFV
while{_x < _lightCount} do{
    _locationS = [_locationSpawn, random 50, random 50] call BIS_fnc_relPos;
    _veh = [_locationS,(apcPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    [_veh,east] call Zen_SpawnVehicleCrew;
    _locationS = [_locationS,10,10] call Zen_ExtendPosition;
    _group = [_locationS, east, "infantry", 8,"Basic"] call Zen_SpawnInfantry;
    [_group,_veh] call Zen_MoveInVehicle;       
    [_veh, _location,300,[0,360],"limited"] spawn Zen_OrderVehiclePatrol;
    _x = _x + 1;
};
    
Sleep 450;
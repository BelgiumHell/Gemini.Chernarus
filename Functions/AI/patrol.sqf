/////////////////////////
//Script made by Jochem//
/////////////////////////
//Get position
_location = [0,0,[blackMarkers,["mrk_area"],[]],1,[1,700]] call Zen_FindGroundPosition;

//Spawn vehicle
_veh = [_location,((apcPool + carPool) call BIS_fnc_selectRandom),0,0] call Zen_SpawnVehicle;
createVehicleCrew _veh;
_veh addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
zeusMod addCuratorEditableObjects [[_veh],false];
zeusMod addCuratorEditableObjects [(crew _veh),false];

//Spawn infantry
_count = (_veh emptyPositions "cargo");
_groupV = [[0,0,0], east, "infantry", (_count - 1),"Basic"] call Zen_SpawnInfantry;
zeusMod addCuratorEditableObjects [(units _groupV),false];

[_groupV,_veh] spawn Zen_MoveInVehicle;

sleep 2;
{
	if(vehicle _x != _veh)then{
		deleteVehicle _x;
	};
}forEach (units _groupV);
(units _groupV) joinSilent (group (driver _veh));

{
	_x setVariable ["patrol", ["mrk_area"], true];
}forEach (units (group (driver _veh)));

_veh setVariable ["patrol",[_veh, "mrk_area"],true];
_veh setCombatMode "RED";
_veh setBehaviour "COMBAT";

[[(group (driver _veh))]]call JOC_cacheGroup;
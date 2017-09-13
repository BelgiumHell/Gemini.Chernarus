/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_truck", "_objArray", "_respawn"];

{
	deleteVehicle _x;
} forEach _objArray;

[[_truck], {
	params["_truck"];
	_truck lock 0;
}] remoteExec ["BIS_fnc_spawn", 0, true];

_respawn call BIS_fnc_removeRespawnPosition;

[[_truck], {
	params["_truck"];
	
	["RespawnAdded", ["DEPLOYMENT POINT", format ["HQ dismantled at grid %1", mapGridPosition (getPos _truck)], "\A3\ui_f\data\map\markers\nato\b_hq.paa"]] spawn BIS_fnc_showNotification;
}] remoteExec ["BIS_fnc_spawn", 0, false];

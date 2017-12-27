/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_truck"];

waitUntil {sleep 60;(!(alive _truck))};
fobTrucks = fobtrucks - [_truck];

_fobArr = _truck getVariable ["assignedFob"];
_objects = _fobArr select 0;
_marker = _fobArr select 1;
_respawn = _fobArr select 2;

deleteMarker _marker;

_respawn call BIS_fnc_removeRespawnPosition;

[[_truck],{
	params["_truck"];

	["RespawnAdded",["DEPLOYMENT POINT",format ["HQ destroyed at grid %1",mapGridPosition (getPos _truck)],"\A3\ui_f\data\map\markers\nato\b_hq.paa"]] spawn BIS_fnc_showNotification;
}] remoteExec ["BIS_fnc_call",0,false];
deleteVehicle _truck;
sleep 5;
fobCount = fobCount - 1;

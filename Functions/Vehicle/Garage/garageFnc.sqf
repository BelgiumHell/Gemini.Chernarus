
private["_veh","_dis","_vehType","_nVeh"];

_spawnObj = _this select 0;
		
waitUntil {isNull(uiNamespace getVariable ["BIS_fnc_arsenal_cam",objNull])};
_veh = nearestObject [_spawnObj, "AllVehicles"];
_dis = _veh distance _spawnObj;
	
if(_dis > 5)then{}else{
	_vehType = typeOf _veh;
	deleteVehicle _veh;	
	sleep 0.5;
	_nVeh = _vehType createVehicle (getPos _spawnObj);
	_nVeh setDir (getDir _spawnObj);	
};
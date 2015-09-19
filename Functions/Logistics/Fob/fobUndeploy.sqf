/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_truck"];

_truck = _this select 0;
_objArray = _this select 1;

{
	deleteVehicle _x;
}forEach _objArray;

[[[_truck],{(_this select 0) setVehicleLock "UNLOCKED";removeAllActions (_this select 0);}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[["RespawnAdded",["DEPLOYMENT POINT",format ["HQ dismantled at grid %1", mapGridPosition (getPos _truck)],"\A3\ui_f\data\map\markers\nato\b_hq.paa"]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;	//Notification
[[[_truck],{_action = (_this select 0) addAction["Deploy FOB",{[(_this select 0)] spawn JOC_fobDeploy;},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

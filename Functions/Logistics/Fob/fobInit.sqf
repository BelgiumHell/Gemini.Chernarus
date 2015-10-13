/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_truck"];

_truck = _this select 0;
_truck setVariable ["ace_medical_medicClass", 1];
[["RespawnAdded",["DEPLOYMENT POINT","A new FOB is available at base","\A3\ui_f\data\map\markers\nato\b_hq.paa"]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;	//Notification
[[[_truck],{_action = (_this select 0) addAction["Deploy FOB",{[(_this select 0)] spawn JOC_fobDeploy;},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
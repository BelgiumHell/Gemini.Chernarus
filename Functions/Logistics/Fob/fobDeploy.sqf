/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_truck"];

_truck = _this select 0;
[[[_truck],{removeAllActions (_this select 0);(_this select 0) setVehicleLock "LOCKED";}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

{
	_x action ["eject", _truck]
} forEach (crew _truck);

_spawnPos= [(getPos _truck),3,((direction _truck) + 90)] call Zen_ExtendPosition;
_marker = createMarker ["mrk_FOB", (_spawnPos)];
_marker setMarkerType "flag_NATO";
_marker setMarkerText "FOB";

[["RespawnAdded",["DEPLOYMENT POINT",format ["HQ deployed at grid %1", mapGridPosition (getPos _truck)],"\A3\ui_f\data\map\markers\nato\b_hq.paa"]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;	//Notification
[[[_truck],{_action = (_this select 0) addAction["Dismantle FOB",{[(_this select 0)] spawn JOC_fobUndeploy;},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_truck],{_action = (_this select 0) addAction["Return to base",{(_this select 1) setPosASL getPosASL respawn_obj;},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[{flagPole addAction ["Go to FOB", {(_this select 1) setPosASL getMarkerPos "mrk_FOB"}];},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_truck"];

_truck = _this select 0;
[[[_truck],{removeAllActions (_this select 0);(_this select 0) setVehicleLock "LOCKED";}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

{
	_x action ["eject", _truck]
} forEach (crew _truck);

_name = [6] call Zen_StringGenerateRandom;
_marker = createMarker [_name, (getPos _truck)];
_marker setMarkerType "b_support";
_marker setMarkerText "FOB";

[["RespawnAdded",["DEPLOYMENT POINT",format ["HQ deployed at grid %1", mapGridPosition (getPos _truck)],"\A3\ui_f\data\map\markers\nato\b_hq.paa"]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;	//Notification
[[[_truck,_name],{_action = (_this select 0) addAction["Dismantle FOB",{[(_this select 0),(_this select 1)] spawn JOC_fobUndeploy;},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_truck],{_action = (_this select 0) addAction["Relocate",{
	_fobArray = []call JOC_fobGetLocations;
	[(findDisplay 46), getpos (_this select 1), _fobArray, [], [], [], 1, false] call BIS_fnc_strategicMapOpen;
},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

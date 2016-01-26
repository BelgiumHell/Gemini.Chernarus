/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_truck"];

[[_truck],{
    params["_truck"];
    ["RespawnAdded",["DEPLOYMENT POINT","A new FOB is available at base","\A3\ui_f\data\map\markers\nato\b_hq.paa"]]call BIS_fnc_showNotification;

    _action = ["deployFob", "Deploy FOB", "", {[(_this select 0)] spawn JOC_fobDeploy;}, {(side (_this select 1) == west) && (speed (_this select 0) < 1)}] call ace_interact_menu_fnc_createAction;
    [_truck, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
    _truck setVariable ["ace_medical_medicClass", 1];
}] remoteExec ["BIS_fnc_spawn", 0, true];

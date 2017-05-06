/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_truck"];

//Deploy
[[_truck],{
    params["_truck"];
    ["RespawnAdded",["DEPLOYMENT POINT","A new FOB is available at base","\A3\ui_f\data\map\markers\nato\b_hq.paa"]]call BIS_fnc_showNotification;

    _action = ["deployFob","Deploy FOB","",{
        [(_this select 0)]call JOC_fobDeploy;
    },{(side (_this select 1) == west) && (speed (_this select 0) < 1) && (locked (_this select 0) != 2) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
    [_truck,0,["ACE_MainActions"],_action]call ace_interact_menu_fnc_addActionToObject;

    _truck setVariable ["ace_medical_medicClass",1];
}] remoteExec ["BIS_fnc_spawn",0,true];

//Dismantle option
[[_truck],{
    params["_truck"];

    _action = ["deployFob","Dismantle FOB","",{
        params["_truck"];

        _objArray = _truck getVariable "assignedFob";

		[(_this select 0),(_objArray select 0),(_objArray select 2)]call JOC_fobUndeploy;
		deleteMarker (_objArray select 1);
	},{(side (_this select 1) == west) && (speed (_this select 0) < 1) && (locked (_this select 0) == 2) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;

    [_truck,0,["ACE_MainActions"],_action]call ace_interact_menu_fnc_addActionToObject;
}] remoteExec ["BIS_fnc_spawn",0,true];

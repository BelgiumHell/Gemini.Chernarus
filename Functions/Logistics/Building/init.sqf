/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_crate"];

[[_crate],{
    params["_crate"];
    _action = ["openInterface","Building interface","",{[(_this select 0)]spawn JOC_buildBuild},{alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate,0,["ACE_MainActions"],_action]call ace_interact_menu_fnc_addActionToObject;
}] remoteExec ["BIS_fnc_spawn",0,true];
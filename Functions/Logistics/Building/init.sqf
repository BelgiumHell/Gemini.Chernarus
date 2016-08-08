/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_crate"];

[[_crate],{
    params["_crate"];
    _actionC = ["placeWall", "Concrete wall", "", {["Land_CncWall4_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionC]call ace_interact_menu_fnc_addActionToObject;

    _actionC = ["placeHB", "H-barrier", "", {["Land_HBarrierWall4_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionC]call ace_interact_menu_fnc_addActionToObject;

    _actionC = ["placeSandbag", "Sandbag", "", {["Land_BagFence_Long_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionC]call ace_interact_menu_fnc_addActionToObject;

    _actionC = ["placeRazorwire", "Razorwire", "", {["Land_Razorwire_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionC]call ace_interact_menu_fnc_addActionToObject;

    _actionC = ["placeTowerH", "Bunker", "", {["Land_HBarrierTower_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionC]call ace_interact_menu_fnc_addActionToObject;

    _actionC = ["placeTower", "Watchtower", "", {["Land_Cargo_Patrol_V1_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionC]call ace_interact_menu_fnc_addActionToObject;
}] remoteExec ["BIS_fnc_spawn", 2, true];
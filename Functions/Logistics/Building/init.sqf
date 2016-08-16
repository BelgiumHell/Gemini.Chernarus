/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_crate"];

[[_crate],{
    params["_crate"];
    _actionA = ["placeWall", "Concrete wall", "", {["Land_CncWall4_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionA]call ace_interact_menu_fnc_addActionToObject;

    _actionB = ["placeHB", "H-barrier", "", {["Land_HBarrierWall4_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionB]call ace_interact_menu_fnc_addActionToObject;

    _actionC = ["placeSandbag", "Sandbag", "", {["Land_BagFence_Long_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionC]call ace_interact_menu_fnc_addActionToObject;

    _actionD = ["placeRazorwire", "Razorwire", "", {["Land_Razorwire_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionD]call ace_interact_menu_fnc_addActionToObject;

    _actionE = ["placeTowerH", "Bunker", "", {["Land_HBarrierTower_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionE]call ace_interact_menu_fnc_addActionToObject;

    _actionF = ["placeTower", "Watchtower", "", {["Land_Cargo_Patrol_V1_F"]call JOC_buildPlaceObject}, {alive (_this select 0)}]call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _actionF]call ace_interact_menu_fnc_addActionToObject;
}] remoteExec ["BIS_fnc_spawn", 0, true];
/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_crate"];

[[_crate],{
    _action = ["placeWall", "Concrete wall", "", {["Land_CncWall4_F"]spawn JOC_buildPlaceObject}, {((format["%1",_this select 1]) in logisticsArray) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["placeHB", "H-barrier", "", {["Land_HBarrierWall4_F"]spawn JOC_buildPlaceObject}, {((format["%1",_this select 1]) in logisticsArray) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["placeSandbag", "Sandbag", "", {["Land_BagFence_Long_F"]spawn JOC_buildPlaceObject}, {((format["%1",_this select 1]) in logisticsArray) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["placeRazorwire", "Razorwire", "", {["Land_Razorwire_F"]spawn JOC_buildPlaceObject}, {((format["%1",_this select 1]) in logisticsArray) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["placeTowerH", "Bunker", "", {["Land_HBarrierTower_F"]spawn JOC_buildPlaceObject}, {((format["%1",_this select 1]) in logisticsArray) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["placeTower", "Watchtower", "", {["Land_Cargo_Patrol_V1_F"]spawn JOC_buildPlaceObject}, {((format["%1",_this select 1]) in logisticsArray) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
    [_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExec ["BIS_fnc_spawn", 2, true];

/*
//Add addaction
[[[_crate],{_action = (_this select 0) addAction["Concrete wall",{["Land_CncWall4_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["H-barrier",{["Land_HBarrierWall4_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Sandbag",{["Land_BagFence_Long_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Razorwire",{["Land_Razorwire_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Bunker",{["Land_HBarrierTower_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Watchtower",{["Land_Cargo_Patrol_V1_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
*/

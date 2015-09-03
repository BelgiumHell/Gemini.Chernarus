/////////////////////////
//Script made by Jochem//
/////////////////////////
_crate = _this select 0;

if(!isServer)exitWith{}; 

//Add addaction
[[[_crate],{_action = (_this select 0) addAction["Concrete wall",{["Land_CncWall4_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["H-barrier",{["Land_HBarrierWall4_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Sandbag",{["Land_BagFence_Long_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Razorwire",{["Land_Razorwire_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Bunker",{["Land_HBarrierTower_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_crate],{_action = (_this select 0) addAction["Watchtower",{["Land_Cargo_Patrol_V1_F"]spawn JOC_buildPlaceObject},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
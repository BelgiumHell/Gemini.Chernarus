/////////////////////////
//Script made by Jochem//
/////////////////////////
_airA = ["RHS_UH60M","RHS_AH64D","B_Heli_Transport_03_F","B_Heli_Transport_01_F","RHS_CH_47F"] + ["BAF_Apache_AH1_DG1","BAF_Merlin_HC3_DG1","BAF_Merlin_HC3_DG1","BAF_Puma_VA_DG1","BAF_AW159_Wildcat_Armed_DG1"];
_carA = ["rhsusf_m1025_w_m2","rhsusf_m1025_w_mk19","rhsusf_m1025_w","rhsusf_m1025_w_s","rhsusf_m998_w_2dr","rhsusf_m998_w_4dr","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"] + ["BAF_Jackal2_GMG_W_DG1","BAF_Jackal2_L2A1_W_DG1","BAF_LandRover_Special_W_DG1"];
_armorA = ["rhsusf_m1a2sep1wd_usarmy","rhsusf_m1a2sep1tuskiwd_usarmy","rhsusf_m1a2sep1tuskiiwd_usarmy","rhsusf_m113_usarmy","rhsusf_m113d_usarmy_M240","rhsusf_m113d_usarmy_MK19","rhsusf_m113d_usarmy_unarmed","RHS_M2A3","RHS_M2A3_BUSKI","RHS_M2A3_BUSKIII","RHS_M6"] + ["BAF_FV510_W_SLAT_DG1","BAF_FV510_W_NOSLAT_DG1"];
_suppA = ["B_Heli_Transport_03_unarmed_F","B_APC_Tracked_01_CRV_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F"];
_medA = ["RHS_UH60M_MEV","rhsusf_m113_usarmy_medical","B_Truck_01_medical_F"] + ["BAF_LandRover_Ambulance_W_DG1"];

garage_spawn_0 setVariable["count",0];
garage_spawner_0 addAction ["Request vehicle",{
	if(garage_spawn_0 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_0),["AllVehicles"],3] - [garage_spawn_0]);
	if(((count _veh) >= 1) or ((garage_spawn_0 getVariable "count") >= 1))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_0), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_0]spawn JOC_garageFnc;
	};
},_airA];

garage_spawn_1 setVariable["count",0];
garage_spawner_1 addAction ["Request vehicle",{
	if(garage_spawn_1 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_1),["AllVehicles"],3] - [garage_spawn_1]);
	if(((count _veh) >= 1) or ((garage_spawn_1 getVariable "count") >= 1))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_1), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_1]spawn JOC_garageFnc;
	};
},_airA];

garage_spawn_2 setVariable["count",0];
garage_spawner_2 addAction ["Request vehicle",{
	if(garage_spawn_2 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_2),["AllVehicles"],3] - [garage_spawn_2]);
	if(((count _veh) >= 1) or ((garage_spawn_2 getVariable "count") >= 1))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_2), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_2]spawn JOC_garageFnc;
	};
},_airA];

garage_spawn_3 setVariable["count",0];
garage_spawner_3 addAction ["Request vehicle",{
	if(garage_spawn_3 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_3),["AllVehicles"],3] - [garage_spawn_3]);
	if(((count _veh) >= 1) or ((garage_spawn_3 getVariable "count") >= 1))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_3), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_3]spawn JOC_garageFnc;
	};
},_airA];

garage_spawn_4 setVariable["count",0];
garage_spawner_4 addAction ["Request vehicle",{
	if(garage_spawn_4 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_4),["AllVehicles"],3] - [garage_spawn_4]);
	if(((count _veh) >= 1) or ((garage_spawn_4 getVariable "count") >= 1))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_4), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_4]spawn JOC_garageFnc;
	};
},_suppA];

garage_spawn_5 setVariable["count",0];
garage_spawner_5 addAction ["Request vehicle",{
	if(garage_spawn_5 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_5),["AllVehicles"],3] - [garage_spawn_5]);
	if(((count _veh) >= 1) or ((garage_spawn_5 getVariable "count") >= 12))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_5), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_5]spawn JOC_garageFnc;
	};
},_carA];

garage_spawn_6 setVariable["count",0];
garage_spawner_6 addAction ["Request vehicle",{
	if(garage_spawn_6 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_6),["AllVehicles"],3] - [garage_spawn_6]);
	if(((count _veh) >= 1) or ((garage_spawn_6 getVariable "count") >= 4))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_6), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_6]spawn JOC_garageFnc;
	};
},_armorA];

garage_spawn_med setVariable["count",0];
garage_spawner_med addAction ["Request vehicle",{
	if(garage_spawn_med getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_med),["AllVehicles"],3] - [garage_spawn_med]);
	if(((count _veh) >= 1) or ((garage_spawn_med getVariable "count") >= 4))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_med), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_med]spawn JOC_garageFnc;
	};
},_medA];

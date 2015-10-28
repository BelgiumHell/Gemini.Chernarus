/////////////////////////
//Script made by Jochem//
/////////////////////////
_airA = ["B_Heli_Transport_03_F","B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F"];
_carA = ["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_covered_F","B_Truck_01_transport_F"];
_armorA = ["B_MBT_01_TUSK_F","B_MBT_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"];
_suppA = ["B_Heli_Transport_03_unarmed_F","B_APC_Tracked_01_CRV_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F"];
_medA = ["B_Truck_01_medical_F"];
_jetA = ["B_Plane_CAS_01_F"];

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

garage_spawn_jet setVariable["count",0];
garage_spawner_jet addAction ["Request vehicle",{
	if(garage_spawn_jet getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_jet),["AllVehicles"],3] - [garage_spawn_jet]);
	if(((count _veh) >= 1) or ((garage_spawn_jet getVariable "count") >= 1))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_jet), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		["Open",true] call BIS_fnc_garage;
		[garage_spawn_jet]spawn JOC_garageFnc;
	};
},_jetA];

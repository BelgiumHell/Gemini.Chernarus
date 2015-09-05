
_airA = ["RHS_UH60M","RHS_AH64D_wd_AA","MELB_H6M","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_01_camo_F","RHS_CH_47F"];
_carA = ["rhsusf_m1025_w_m2","rhsusf_m1025_w_s_m2","rhsusf_m1025_w_mk19","rhsusf_m1025_w_s_Mk19","rhsusf_m1025_w","rhsusf_m1025_w_s","rhsusf_m998_w_2dr_fulltop","rhsusf_m998_w_2dr_halftop","rhsusf_m998_w_2dr","rhsusf_m998_w_4dr_fulltop","rhsusf_m998_w_4dr_halftop","rhsusf_m998_w_4dr"];
_armorA = ["rhsusf_m1a2sep1wd_usarmy","rhsusf_m1a2sep1tuskiwd_usarmy","rhsusf_m1a2sep1tuskiiwd_usarmy","rhsusf_m113_usarmy","RHS_M2A3_wd","RHS_M2A3_BUSKI_wd","RHS_M2A3_BUSKIII_wd","RHS_M6_wd"];
_allowCiv = false;

_vehicleData = [

	//OPFOR

	[

		[],	//CARS

		[],	//ARMOUR

		[],	//HELIS

		[],	//PLANES

		[],	//NAVAL

		[]	//STATICS

	],

	//BLUFOR

	[	

		[],	//CARS

		[],	//ARMOUR

		[],	//HELIS

		[],	//PLANES

		[],	//NAVAL

		[]	//STATICS

	],

	//INDEPENDENT

	[	

		[],	//CARS

		[],	//ARMOUR

		[],	//HELIS

		[],	//PLANES

		[],	//NAVAL

		[]	//STATICS

	],

	//CIVILIAN

	[	

		[],	//CARS

		[],	//ARMOUR

		[],	//HELIS

		[],	//PLANES

		[],	//NAVAL

		[]	//STATICS

	]

];


_vehicleDataTypes_enum = [

	[ "car", "carx" ],

	[ "tank", "tankx" ],

	[ "helicopter", "helicopterx", "helicopterrtd" ],

	[ "airplane", "airplanex" ],

	[ "ship", "shipx", "sumbarinex" ]

];



_fnc_getVehicleDataTypeIndex = {

	_type = toLower _this;

	_return = -1;

	{

		if ( _type in _x ) exitWith {

			_return = _forEachIndex;

		};

	}forEach _vehicleDataTypes_enum;



	_return

};



_defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");

"

	_cfgPath = _x;

	_simulType = getText ( _cfgPath >> 'simulation' );

	_simulIndex = _simulType call _fnc_getVehicleDataTypeIndex;

	if ( ( tolower ( getText ( _cfgPath >> 'vehicleClass' ) ) isEqualTo 'static' ) ) then {

		_simulIndex = 5;

	};



	if ( getnumber (_cfgPath >> 'scope') == 2 && {gettext (_cfgPath >> 'crew') != _defaultCrew} && { _simulIndex >= 0 }  ) then {



		_side = getNumber ( _cfgPath >> 'side' );

		_model = getText ( _cfgPath >> 'model' );



		_sides = [ _side ];

		if ( _allowCiv && { _side isEqualTo 3 }  ) then {

			_sides = _sides + [ 0, 1, 2 ];

		};



		{



			_tmpSide = _vehicleData select _x;

			_tmpTypes = _tmpSide select _simulIndex;



			_index = ( _tmpTypes find _model );

			if ( _index >= 0 ) then {

				_index = _index + 1;

				( _tmpTypes select _index ) pushback _cfgPath;

			}else{

				_tmpTypes pushback _model;

				_tmpTypes pushback [ _cfgPath ];

			};

		}foreach _sides;



	};



" configClasses ( configFile >> "CfgVehicles" );


testV = _vehicleData;

garage_spawner_0 addAction ["Spawn vehicle",{
	_veh = nearestObjects [(getPos garage_spawn_0),["AllVehicles"],5];
	{
		deleteVehicle _x;
	}forEach _veh;
	BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_0), [], 0, "CAN_COLLIDE" ];
	_array = ( _this select 3 ) select ( side player call BIS_fnc_sideID );
	BIS_fnc_garage_data = [[],[],(_array select 2),[],[],[]];
	["Open",true] call BIS_fnc_garage;
	[garage_spawn_0]spawn JOC_garageFnc;
},_vehicleData];

garage_spawner_1 addAction ["Spawn vehicle",{
	_veh = nearestObjects [(getPos garage_spawn_1),["AllVehicles"],5];
	{
		deleteVehicle _x;
	}forEach _veh;
	BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_1), [], 0, "CAN_COLLIDE" ];
	_array = ( _this select 3 ) select ( side player call BIS_fnc_sideID );
	BIS_fnc_garage_data = [[],[],(_array select 2),[],[],[]];
	["Open",true] call BIS_fnc_garage;
	[garage_spawn_1]spawn JOC_garageFnc;
},_vehicleData];

garage_spawner_2 addAction ["Spawn vehicle",{
	_veh = nearestObjects [(getPos garage_spawn_2),["AllVehicles"],5];
	{
		deleteVehicle _x;
	}forEach _veh;
	BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_2), [], 0, "CAN_COLLIDE" ];
	_array = ( _this select 3 ) select ( side player call BIS_fnc_sideID );
	BIS_fnc_garage_data = [[],[],(_array select 2),[],[],[]];
	["Open",true] call BIS_fnc_garage;
	[garage_spawn_2]spawn JOC_garageFnc;
},_vehicleData];

garage_spawner_3 addAction ["Spawn vehicle",{
	_veh = nearestObjects [(getPos garage_spawn_3),["AllVehicles"],5];
	{
		deleteVehicle _x;
	}forEach _veh;
	BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_3), [], 0, "CAN_COLLIDE" ];
	_array = ( _this select 3 ) select ( side player call BIS_fnc_sideID );
	BIS_fnc_garage_data = [[],[],(_array select 2),[],[],[]];
	["Open",true] call BIS_fnc_garage;
	[garage_spawn_3]spawn JOC_garageFnc;
},_vehicleData];

garage_spawner_4 addAction ["Spawn vehicle",{
	_veh = nearestObjects [(getPos garage_spawn_4),["AllVehicles"],5];
	{
		deleteVehicle _x;
	}forEach _veh;
	BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_4), [], 0, "CAN_COLLIDE" ];
	_array = ( _this select 3 ) select ( side player call BIS_fnc_sideID );
	BIS_fnc_garage_data = [[],[],(_array select 2),[],[],[]];
	["Open",true] call BIS_fnc_garage;
	[garage_spawn_4]spawn JOC_garageFnc;
},_vehicleData];

garage_spawner_5 addAction ["Spawn vehicle",{
	_veh = nearestObjects [(getPos garage_spawn_5),["AllVehicles"],5];
	{
		deleteVehicle _x;
	}forEach _veh;
	BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_5), [], 0, "CAN_COLLIDE" ];
	_array = ( _this select 3 ) select ( side player call BIS_fnc_sideID );
	BIS_fnc_garage_data = [(_array select 0),[],[],[],[],[]];
	["Open",true] call BIS_fnc_garage;
	[garage_spawn_5]spawn JOC_garageFnc;
},_vehicleData];

garage_spawner_6 addAction ["Spawn vehicle",{
	_veh = nearestObjects [(getPos garage_spawn_6),["AllVehicles"],5];
	{
		deleteVehicle _x;
	}forEach _veh;
	BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_6), [], 0, "CAN_COLLIDE" ];
	_array = ( _this select 3 ) select ( side player call BIS_fnc_sideID );
	BIS_fnc_garage_data = [[],(_array select 1),[],[],[],[]];
	["Open",true] call BIS_fnc_garage;
	[garage_spawn_6]spawn JOC_garageFnc;
},_vehicleData];
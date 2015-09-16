/////////////////////////
//Script made by Jochem//
/////////////////////////

//[amount(SCALAR),patrol(BOOLEAN)] heli:[amount(SCALAR),patrol(BOOLEAN),type(STRING)]
private["_location","_radius","_inf","_car","_apc","_ifv","_tank","_heli","_boat"];
_location = _this select 0;
_radius = _this select 1;
_inf = _this select 2;
_car = _this select 3;
_apc = _this select 4;
_ifv = _this select 5;
_tank = _this select 6;
_heli = _this select 7;
_boat = _this select 8;

//if(_radius < 1)exitWith{};

//Spawn infantry
_j = 0;
if((_inf select 0) > 0)then{
	while{_j < (_inf select 0)} do{
		_locationS = [_location,[0,_radius],0,1] call Zen_FindGroundPosition;
		_locationS = [_locationS,1,1] call Zen_ExtendPosition;
		_groupV = [_locationS, east, "infantry", 4,"Basic"] call Zen_SpawnInfantry;
		zeusMod addCuratorEditableObjects [(units _groupV),false];
		if(_inf select 1)then{
			[_groupV,_location,[0,_radius],[0,360],"limited","safe"] spawn Zen_OrderInfantryPatrol;
			(leader _groupV) setVariable ["patrol",[_location,[0,_radius],[0,360],"limited","safe"],true];
		};
		_j = _j + 1;
	};
};

//Spawn cars
_j = 0;
if((_car select 0) > 0)then{
	while{_j < (_car select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(carPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
		createVehicleCrew _veh;
		zeusMod addCuratorEditableObjects [[_veh],false];
		zeusMod addCuratorEditableObjects [(crew _veh),false];
		_count = (_veh emptyPositions "cargo");
		_groupV = [[0,0,0], east, "infantry", (_count - 1),"Basic"] call Zen_SpawnInfantry;
		_units = (units _groupV);
		zeusMod addCuratorEditableObjects [(units _groupV),false];
		[_units,_veh] spawn Zen_MoveInVehicle;
		if(_car select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
			_veh setVariable ["patrol",[_location, _radius,[0,360],"limited",true],true];
		};
		_j = _j + 1;
	};
};

//Spawn apc's
_j = 0;
if((_apc select 0) > 0)then{
	while{_j < (_apc select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(apcPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    	createVehicleCrew _veh;
		zeusMod addCuratorEditableObjects [[_veh],false];
		zeusMod addCuratorEditableObjects [(crew _veh),false];
		if(_apc select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
			_veh setVariable ["patrol",[_location, _radius,[0,360],"limited",true],true];
		};
		_j = _j + 1;
	};
};

//Spawn ifv's
_j = 0;
if((_ifv select 0) > 0)then{
	while{_j < (_ifv select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(ifvPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    	createVehicleCrew _veh;
		zeusMod addCuratorEditableObjects [[_veh],false];
		zeusMod addCuratorEditableObjects [(crew _veh),false];
		if(_ifv select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
			_veh setVariable ["patrol",[_location, _radius,[0,360],"limited",true],true];
		};
		_j = _j + 1;
	};
};

//Spawn tanks
_j = 0;
if((_tank select 0) > 0)then{
	while{_j < (_tank select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(tankPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    	createVehicleCrew _veh;
		zeusMod addCuratorEditableObjects [[_veh],false];
		zeusMod addCuratorEditableObjects [(crew _veh),false];
		if(_tank select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
			_veh setVariable ["patrol",[_location, _radius,[0,360],"limited",true],true];
		};
		_j = _j + 1;
	};
};

//Spawn heli's
_heliCount = (_heli select 0);
_heliPatrol = (_heli select 1);
_heliType = (_heli select 2);
_j = 0;
_pool = [];
if(_heliCount > 0)then{
	while{_j < _heliCount} do{
		_locationS = [_location,[0,_radius],0,0,[1,_radius]] call Zen_FindGroundPosition;
		if(_heliType == "transport")then{
			_pool = heliPool;
		};
		if(_heliType == "cas")then{
			_pool = casPool
		};
		_heli = [_locationS,(_pool call BIS_fnc_selectRandom),50] call Zen_SpawnHelicopter;
		zeusMod addCuratorEditableObjects [[_heli],false];
		zeusMod addCuratorEditableObjects [(crew _heli),false];
		_j = _j + 1;
	};
};

//Spawn boats
_boatCount = (_boat select 0);
_boatPatrol = (_boat select 1);
_j = 0;
if(_boatCount > 0)then{
	while{_j < _boatCount} do{
		_locationS = [_location,[0,_radius],0,2] call Zen_FindGroundPosition;
		_boatV = [_locationS,["O_Boat_Armed_01_hmg_F"]] call Zen_SpawnBoat;
		zeusMod addCuratorEditableObjects [[_boatV],false];
		zeusMod addCuratorEditableObjects [(crew _boatV),false];
		if(_boatPatrol)then{
			[_boatV, _location, _radius] spawn Zen_OrderBoatPatrol;
		};
		_j = _j + 1;
	};
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
//Find town
_ok = 0;
_dis = 99999;	//Needs to be high
_count = 0;
_capitalOcc = false;
_capPrev = false;
_targetTown = 0;
_startTown = 0;
while{_ok == 0}do{
	if(_capitalOcc)then{
		_count = 0;
		_capPrev = true;
	};
	
	_lastOcc = bluTowns select ((count bluTowns - 1) - _count);
	_capitalOcc = ((capitalName in opTownsN) and _capPrev);
	
	if(_capitalOcc)then{
		_targetTown = ((nearestLocations [getPosATL player, ["NameCityCapital"], 35000])select 0);
	}else{
		_targetTown = _lastOcc;
	};
	
	{
		_disP = (getPos _targetTown) distance (getPos _x);
		if(_disP <= _dis)then{
			_dis = _disP;
			_startTown = _x;
		};
	}forEach opTowns;
	
	if(_dis <= 3000)then{
		_ok = 1;
	};
	
	_count = _count + 1;
};
_targetP = getPos _targetTown;

//Inform players
[["IntelAdded",[format ["The enemy is preparing to attack %1.", (text _targetTown)]]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;	//Notification
_name = [5] call Zen_StringGenerateRandom;
_marker = createMarker [_name, _targetP];//Marker
_name setMarkerType "mil_warning";
_name setMarkerColor "ColorOPFOR";
_name setMarkerText "Under attack";

//Spawn attack
_truckCount = 0;
_apcCount = 0;
if(_targetTown in (nearestLocations [getPosATL player, ["NameCityCapital"], 35000]))then{
	_truckCount = 10;
	_apcCount = 6;
};
if(_targetTown in (nearestLocations [getPosATL player, ["NameCity"], 35000]))then{
	_truckCount = 6;
	_apcCount = 4;
};
if(_targetTown in (nearestLocations [getPosATL player, ["NameVillage"], 35000]))then{
	_truckCount = 3;
	_apcCount = 1;
};

sleep 600;
    
//Get spawn location
_locationSpawn = getPos _startTown;

_x = 0;
//cars
while{_x < _truckCount} do{
    _locationS = [_locationSpawn,[0,400],0,1,[1,400]] call Zen_FindGroundPosition;
    _veh = [_locationS,(truckPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    [_veh,east] call Zen_SpawnVehicleCrew;
    _count = (_veh emptyPositions "cargo") - 2;
	_group = [_locationS, east, "infantry", _count,"Basic"] call Zen_SpawnInfantry;
	zeusMod addCuratorEditableObjects [(units _group),false];
    [_group,_veh] call Zen_MoveInVehicle;  
	zeusMod addCuratorEditableObjects [[_veh],false];
	zeusMod addCuratorEditableObjects [(crew _veh),false]; 
    [_veh, _targetP,300,[0,360],"full"] spawn Zen_OrderVehiclePatrol;
	_veh setDamage 0;
    _x = _x + 1;
};

_x = 0;
//APC
while{_x < _apcCount} do{
    _locationS = [_locationSpawn,[0,400],0,1,[1,400]] call Zen_FindGroundPosition;
    _veh = [_locationS,(apcPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    [_veh,east] call Zen_SpawnVehicleCrew;
    _count = (_veh emptyPositions "cargo");
	_group = [_locationS, east, "infantry", _count,"Basic"] call Zen_SpawnInfantry;
    [_group,_veh] call Zen_MoveInVehicle;   
	zeusMod addCuratorEditableObjects [[_veh],false];
	zeusMod addCuratorEditableObjects [(crew _veh),false];    
    [_veh, _targetP,300,[0,360],"full"] spawn Zen_OrderVehiclePatrol;
	_veh setDamage 0;
    _x = _x + 1;
};

sleep 1200;
deleteMarker _name;
cmdAttack = true;
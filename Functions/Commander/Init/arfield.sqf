/////////////////////////
//Script made by Jochem//
/////////////////////////
_marker = _this select 0;
_id = _this select 1;
_location = getMarkerPos _marker;
_size = getMarkerSize _marker;
_dir = (markerDir _marker);

[_location,(_size + [_dir]),[11,true],[4,false],[0,false],[3,false],[2,false],[0,false,"cas"],[0,false]] call JOC_spawnZone;

//Spawn empty helicopter-jets
_tentHangars = nearestObjects [_location,["Land_TentHangar_V1_F"],(_size select 0)];
_hangars = nearestObjects [_location,["Land_Hangar_F"],(_size select 0)];

{
    _spawnPos = [getPos _x,30,(getDir _x)] call Zen_ExtendPosition;
    _heli = [_spawnPos,((airPool + casPool) call BIS_fnc_selectRandom),1,(getDir _x)] call Zen_SpawnVehicle;
	_heli enableSimulationGlobal false;
	_heli allowDamage false;
	sleep 2;
	_heli enableSimulationGlobal true;
	_heli allowDamage true;
} forEach _tentHangars;

{
    _heli = [getPos _x,(jetPool call BIS_fnc_selectRandom),1,(getDir _x)] call Zen_SpawnVehicle;
	_heli enableSimulationGlobal false;
	_heli allowDamage false;
	sleep 2;
	_heli enableSimulationGlobal true;
	_heli allowDamage true;
} forEach _tentHangars;

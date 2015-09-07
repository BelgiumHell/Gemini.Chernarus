
private["_veh","_dis","_time"];

_spawnObj = _this select 0;
		
waitUntil {isNull(uiNamespace getVariable ["BIS_fnc_arsenal_cam",objNull])};
_veh = nearestObject [_spawnObj, "AllVehicles"];
_dis = _veh distance _spawnObj;
	
if(_dis > 5)then{}else{
	publicVariable "_veh";
	_spawnObj setVariable["count",((_spawnObj getVariable "count") + 1)];
	_veh setVariable ["pad",_spawnObj];
	_veh setDir (getDir _spawnObj);
	if(_veh isKindOf "car")then{
		_time = 60;				
	};
	if(_veh isKindOf "tank")then{
		_time = 600;
	};
	if(_veh isKindOf "Air")then{
		_time = 600;
	};
	if(_veh isKindOf "Ship")then{
		_time = 60;
	};
	
	//Special cases
	if((typeOf _veh) in motorizedArray)then{
		_time = 480;				
	};
	if((typeOf _veh) in logisticsVehArray)then{
	[_vehicle]spawn JOC_tow;
		_time = 480;			
	};
	if((typeOf _veh) == "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy")then{
		deleteVehicle _veh;					
	};
	if((typeOf _veh) == "rhsusf_m1a2sep1wd_usarmy" or (typeOf _veh) == "rhsusf_m1a2sep1d_usarmy")then{
		_veh addMagazine "rhs_mag_M1069";
	};
	if((typeOf _veh) == "RHS_UH60M_MEV")then{
	    _veh setVariable ["ace_medical_medicClass", 1];
	};

	[[[_veh],{(_this select 0) setVehicleLock "LOCKED";}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
	hint format["Vehicle will be ready in %1 minute(s)", (_time/60)];
	sleep _time;
	[[[_veh],{(_this select 0) setVehicleLock "UNLOCKED";}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
	hint "Vehicle is ready";
};
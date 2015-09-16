/////////////////////////
//Script made by Jochem//
/////////////////////////
if(!isServer)exitWith{};

if(isNil{fobCount})then{
	fobCount = 0;
	[{flagPole addAction ["Relocate", {
		_fobArray = []call JOC_fobGetLocations;
		[(findDisplay 46), getpos (_this select 1), _fobArray, [], [], [], 1, false] call BIS_fnc_strategicMapOpen;
	}];},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
if(fobCount < ((count bluTowns) + 1))then{
	hint "lol";
	_veh = nearestObjects [(getPos fobSpawn),["AllVehicles"],5];
	if((count _veh) >= 1 or (fobCount >= fobLimit))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		_truck = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy" createVehicle [16000,16000,0];
		_truck setDir getDir fobSpawn;
		_truck setPosASL getPosASL fobSpawn;
		_truck setDamage 0;
		zeusMod addCuratorEditableObjects [[_truck],false];
		fobTrucks pushBack _truck;
		hint "FOB will be ready in 5 minutes";
		sleep 300;
		[_truck] call JOC_fobInit;
		[_truck]spawn JOC_fobManager;
	};
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
	//Get airfield loc
	_airfieldID = [false,airfieldOccup]call Zen_ValueFindInArray;
	_mrkN = format ["mrk_heliSpawn_%1",_airfieldID];
	_airfield = getMarkerPos _mrkN;
	_airfield2 = [_airfield,40,0] call Zen_ExtendPosition;

	_heli1 = [_airfield2,(casPool call BIS_fnc_selectRandom),50] call Zen_SpawnHelicopter;
	_heli2 = [_airfield,(airPool call BIS_fnc_selectRandom),0] call Zen_SpawnHelicopter;
	(vehicle _heli1) setVariable["JOC_caching_disabled",true];
	(vehicle _heli2) setVariable["JOC_caching_disabled",true];
	_count = (_heli2 emptyPositions "cargo");
	_groupV = [_airfield, east, "infantry", (_count - 1),"Basic"] call Zen_SpawnInfantry;
	[_groupV,_heli2] spawn Zen_MoveInVehicle;
	[[_heli1,_heli2],"mrk_area",blackMarkers,[0,360],"full"]spawn Zen_OrderVehiclePatrol;

	[_heli2,_groupV]spawn JOC_cmdHeliMonitor;

	{
		_x setVariable ["JOC_disable_caching",true,true];
		_name = [10] call Zen_StringGenerateRandom;
		_x setVehicleVarName _name;
	}forEach _groupV;

	waitUntil{sleep 60; (((fuel _heli1 <= 0.1) or (fuel _heli2 <= 0.1)) or ((!alive _heli1) and (!alive _heli2)))};
	if((fuel _heli1 <= 0.1) or (fuel _heli2 <= 0.1))then{
		[_heli1, _airfield,"full",100,false,true]spawn Zen_OrderHelicopterLand;
		_heli1 addEventHandler["LandedTouchDown",{deleteVehicle ((crew (_this select 0)) select 0);deleteVehicle (_this select 0);}];
		[_heli2, _airfield,"full",100,false,true]spawn Zen_OrderHelicopterLand;
		_heli2 addEventHandler["LandedTouchDown",{deleteVehicle ((crew (_this select 0)) select 0);deleteVehicle (_this select 0);}];
	};

	sleep 1200;
};
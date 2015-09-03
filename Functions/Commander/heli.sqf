/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
	//Get airfield loc
	_airfieldID = [false,airfieldOccup]call Zen_ValueFindInArray;
	_mrkN = format ["mrk_heliSpawn_%1",_airfieldID];
	_airfield = getMarkerPos _mrkN;
	
	_heli1 = [_airfield,(casPool call BIS_fnc_selectRandom),50] call Zen_SpawnHelicopter;
	zeusMod addCuratorEditableObjects [[_heli1],false];
	zeusMod addCuratorEditableObjects [(crew _heli1),false];
	_heli2 = [_airfield,(airPool call BIS_fnc_selectRandom),0] call Zen_SpawnHelicopter;
	(vehicle _heli1) setVariable["JOC_caching_disabled",true];
	(vehicle _heli2) setVariable["JOC_caching_disabled",true];
	_count = (_heli2 emptyPositions "cargo");
	_groupV = [_airfield, east, "infantry", (_count - 1),"Basic"] call Zen_SpawnInfantry;
	zeusMod addCuratorEditableObjects [[_heli2],false];
	zeusMod addCuratorEditableObjects [(crew _heli2),false];
	zeusMod addCuratorEditableObjects [(units _groupV),false];
	[_groupV,_heli2] spawn Zen_MoveInVehicle;
	[[_heli1,_heli2],"mrk_area",[],[0,360],"full"]spawn Zen_OrderVehiclePatrol;
	
	waitUntil{sleep 60; (((fuel _heli1 <= 0.1) or (fuel _heli2 <= 0.1)) or ((!alive _heli1) and (!alive _heli2)))};
	if((fuel _heli1 <= 0.1) or (fuel _heli2 <= 0.1))then{
		[_heli1, _airfield,"full",100,false,true]spawn Zen_OrderHelicopterLand;
		[_heli2, _airfield,"full",100,false,true]spawn Zen_OrderHelicopterLand;
	};
	
	sleep 1200;
};
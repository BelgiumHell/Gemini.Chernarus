/////////////////////////
//Script made by Jochem//
/////////////////////////
waitUntil{sleep 1; (count baseMarkers) >= officerCount};

//Spawn general
_hqPos = getMarkerPos "mrk_hq";
_groupGeneral = createGroup east;

_locationS = ([_hqPos] call Zen_FindBuildingPositions) call BIS_fnc_selectRandom;
general = _groupGeneral createUnit ["O_officer_F",_locationS, [], 0, "NONE"];
general allowFleeing 0;

//Personal protection
_group = [_locationS, east, "infantry", 3,"basic"] call Zen_SpawnInfantry;
{
	[_x] joinSilent _groupGeneral;
} forEach units _group;
deleteGroup _group;

{
	_x setVariable ["JOC_disable_caching",true,true];
	_name = [8] call Zen_StringGenerateRandom;
	_x setVehicleVarName _name;
} forEach (units _groupGeneral);

_s = 0;
while{_s < officerCount}do{
	_baseMarker = baseMarkers select _s;
	_pos = getMarkerPos _baseMarker;

	_nearestBuilding = (nearestObjects [_pos,["Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F"],300]) select 0;

	if(isNull _nearestBuilding)then{
		_nearestBuilding = (nearestObjects [_pos,["Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F"],300]) select 0;
	};

	_locationS = ([getPos _nearestBuilding] call Zen_FindBuildingPositions) call BIS_fnc_selectRandom;
	_groupOfficer = createGroup east;
	_officer = _groupOfficer createUnit ["O_officer_F",_locationS, [], 0, "NONE"];
	_officer allowFleeing 0;

	//Personal protection
	_group = [_locationS, east, "infantry", 3,"basic"] call Zen_SpawnInfantry;
	{
		[_x] joinSilent _groupOfficer;
	} forEach units _group;
	deleteGroup _group;

	{
		_x setVariable ["JOC_disable_caching",true,true];
		_name = [8] call Zen_StringGenerateRandom;
		_x setVehicleVarName _name;
	} forEach (units _groupOfficer);

	officerArray pushback _officer;

   	_s = _s + 1;
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
_location = _this select 0;

//Get amount of military structures
_towersB = nearestObjects [_location,["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F"],300];
_towersS = nearestObjects [_location,["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F"],300];
_compoundsB = nearestObjects [_location,["Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F"],300];
_compoundsS = nearestObjects [_location,["Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],300];

//Get random sequence for small compounds
_compoundsR = [_compoundsS, ((count _compoundsS)/2)]call Zen_ArrayGetRandomSequence;

//Spawn garrisoned infantry
{
    _pos = getPos _x;
    _groupV = [_pos, east, "infantry", 6,"Basic"] call Zen_SpawnInfantryGarrison;
} forEach _towersB;

{
    _pos = getPos _x;
    _groupV = [_pos, east, "infantry", 2,"Basic"] call Zen_SpawnInfantryGarrison;
} forEach _towersS;

{
    _pos = getPos _x;
    _groupV = [_pos, east, "infantry", 5,"Basic"] call Zen_SpawnInfantryGarrison;
} forEach _compoundsB;

{
    _pos = getPos _x;
    _groupV = [_pos, east, "infantry", 2,"Basic"] call Zen_SpawnInfantryGarrison;
} forEach _compoundsR;

//Spawn patrolling infantry
[_location,300,[7,true],[2,false],[0,false],[1,false],[1,false],[0,false,"cas"],[0,false]] call JOC_spawnZone;

_trgO = createTrigger ["EmptyDetector",_location];
_trgO setTriggerArea [_size,_size,_size,false];
_trgO setTriggerActivation ["EAST","PRESENT", false];
_trgO setTriggerStatements ["this","",""];

_marker = "";

{
    if((_location distance (getMarkerPos _x)) < 100)then{
        _marker = _x;
    };
} forEach baseMarkersO;

[_marker, "base"]spawn JOC_monitorMarker;

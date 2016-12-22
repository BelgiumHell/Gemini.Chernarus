/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_location","_size"];
_groups = [];

//Get amount of military structures
_towersB = nearestObjects [_location,["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F"],_size];
_towersS = nearestObjects [_location,["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F"],_size];
_compoundsB = nearestObjects [_location,["Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F"],_size];
_compoundsS = nearestObjects [_location,["Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],_size];

//Get random sequence for small compounds
_compoundsR = [_compoundsS, ((count _compoundsS)/1.5)]call Zen_ArrayGetRandomSequence;
if (_size < 50) then {
    _compoundsR = _compoundsS;
};

//Spawn garrisoned infantry
{
    _id = [[0,0,0],ceil((count (_x buildingPos - 1)) * 0.5),0,[true,_x],0.6]call JOC_spawnGroup;

	_groups pushBack _id;
} forEach (_towersB + _towersS + _compoundsB + _compoundsR);

_groups

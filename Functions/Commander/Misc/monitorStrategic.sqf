/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_marker","_id"];

_array = (strategicArray select _id);
_owner = 1;	//0 = BLUFOR|1 = OPFOR
_objects = [];
_random = random(10);	//should spread load

//Create object triggers
_location = getMarkerPos _marker;
_size = getMarkerSize _marker;
_dir = markerDir _marker;

_trgO = createTrigger ["EmptyDetector",_location,true];
_trgO setTriggerArea [(_size select 0),(_size select 1),1200,false];
_trgO setTriggerActivation ["EAST","PRESENT", false];
_trgO setTriggerStatements ["this","",""];
_trgO setTriggerTimeout [5,5,5,true];
_trgO setDir _dir;

_trgB = createTrigger ["EmptyDetector",_location,true];
_trgB setTriggerArea [(_size select 0),(_size select 1),1200,false];
_trgB setTriggerActivation ["WEST","PRESENT", false];
_trgB setTriggerStatements ["this","",""];
_trgB setTriggerTimeout [5,5,5,true];
_trgB setDir _dir;

sleep 5;

while{true}do{

    //Set blufor owner
	if(((count list _trgB >= 4) and (count list _trgO <= 5)) and _owner == 1)then{
        (strategicArray select _id) set [4, west];
		_owner = 0;
	};

    //Set opfor owner
	if(((count list _trgB <= 3) and (count list _trgO >= 5)) and _owner == 0)then{
        (strategicArray select _id) set [4, east];
		_owner = 1;
	};

	//If point has no strategic value anymore, set civilian as owner/Check for ammo
	switch (_array select 2) do {
		case "aa": {
            _objects = nearestObjects [_location,[aaClass],100];
			if(((_objects select 0) ammo (currentWeapon (_objects select 0))) < 0.3)then{
				//[_array]call JOC_logSupply;
			};
        };
        case "radar": {
			_objects = nearestObjects [_location,["Land_Radar_F","Land_Radar_Small_F"],10];
        };
        case "airfield":{
			_objects = [objNull];
        };
        case "arty": {
			_objects = nearestObjects [_location,[artyClass],100];
			if(((_objects select 0) ammo (currentWeapon (_objects select 0))) < 0.3)then{
				//[_array]call JOC_logSupply;
			};
        };
        case "base": {
			_objects = nearestObjects [_location,["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Dome_Big_F","Land_Dome_Small_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F"],300];
        };
        case "outpost": {
			_objects = nearestObjects [_location,["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],50];
        };
        case "factory": {
			_objects = [objNull];
        };
        case "radio":{
			_objects = nearestObjects [_location,["Land_TTowerBig_1_F","Land_TTowerBig_2_F"],10];
        };
        case "town": {
			_objects = [objNull];
        };
	};
	if(count _objects == 0)then{
		(strategicArray select _id) set [4, civilian];
	};

	//Check if point is under attack
	if((count list _trgB) > 1 && (count list _trgO) > 1)then{
		(strategicArray select _id) set [4, independent];
	};

    //Call for support
    if((count list _trgB) > (count list _trgO) * 0.5 && _owner == 1)then{
        [_array,(list _trgO),(list _trgB)]spawn JOC_cmdCmdreqSupport;
		_owner = 2;
    };

	sleep (_random + 10);
};

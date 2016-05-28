/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array","_id"];

_pos = _array select 0;
_size = _array select 1;
_marker = _array select 3;
_owner = _array select 4;	//0 = BLUFOR|1 = OPFOR|2 = contested by BLUFOR|3 = contested by OPFOR|4 = no value
_objects = [];

if(_owner == 4)exitWith{};

//If point has no strategic value anymore, set civilian as owner/Check for ammo
switch (_array select 2) do {
	case "aa": {
        _objects = _pos nearEntities [[aaClass],100];
		if(((_objects select 0) ammo (currentWeapon (_objects select 0))) < 0.3)then{
			//[_array]call JOC_cmdLogSupply;
		};
    };
    case "radar": {
		_objects = nearestObjects [_pos,["Land_Radar_F","Land_Radar_Small_F"],10];
    };
    case "airfield":{
		_objects = [objNull];
    };
    case "arty": {
		_objects = _pos nearEntities [[artyClass],100];
		if(((_objects select 0) ammo (currentWeapon (_objects select 0))) < 0.3)then{
			//[_array]call JOC_cmdLogSupply;
		};
    };
    case "camp": {
        _objects = [objNull];
    };
    case "base": {
		_objects = nearestObjects [_pos,["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Dome_Big_F","Land_Dome_Small_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F"],300];
    };
    case "outpost": {
		_objects = nearestObjects [_pos,["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],50];
    };
    case "factory": {
		_objects = [objNull];
    };
    case "radio":{
		_objects = nearestObjects [_pos,["Land_TTowerBig_1_F","Land_TTowerBig_2_F"],10];
    };
    case "town": {
		_objects = [objNull];
    };
};

if(count _objects == 0)then{
	(strategicArray select _id) set [4, 4];
};

//Check if point is under attack
_nearWest = count [_pos , _size, ["air"]]call JOC_nearestPlayers;

if(_nearWest == 0)exitWith{};

_nearEast = east countSide (_pos nearEntities [["Man","Car","Tank"],_size]);

//Set blufor owner
if(_nearEast == 0 && _nearWest > 0 && _owner == 1)then{
    (strategicArray select _id) set [4, 0];
};

//Set opfor owner
if(_nearWest == 0 && _nearEast > 0 && _owner == 0)then{
    (strategicArray select _id) set [4, 1];
};

if(_nearEast > 0 && _nearWest > 0)then{
    if(_owner == 1)then{
        (strategicArray select _id) set [4, 2];
        if(_nearWest > (_nearEast * 0.5))then{
            //[_array,(list _trgO),(list _trgB)]spawn JOC_cmdCmdreqSupport;
        	//[]call JOC_
        };
    };
    if(_owner == 0)then{
        (strategicArray select _id) set [4, 3];
    };
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    _index = _forEachIndex;
    _pos = _x select 0;
    _priority = _x select 1;
    _type = _x select 2;
    _marker = _x select 3;

    _groups = [];
    _groupsB = [];

    switch (_type) do {
        case "aa": {
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[3,true],[1,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "radar": {
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[6,true],[2,false],[0,false],[2,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "airfield":{
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[11,true],[4,false],[0,false],[3,false],[2,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "arty": {
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[3,true],[1,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "base": {
            _groupsB = [_pos,300]call JOC_cmdSpawnBase;
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[8,true],[2,false],[0,false],[2,false],[1,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "camp": {
            _groups = [_pos,([5,5] + [markerDir _marker]),[1,true],[0,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "outpost": {
            _groupsB = [_pos,50]call JOC_cmdSpawnBase;
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[2,true],[0,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "factory": {
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[6,true],[2,false],[0,false],[2,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "radio":{
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[3,true],[1,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "roadblock":{
            _groupsB = [_pos,50]call JOC_cmdSpawnBase;
            _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[1,true],[0,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "town": {
            switch (_priority) do {
                case 300: {
                    _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[0,true],[1,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
                };
                case 500: {
                    _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[7,true],[2,false],[0,false],[1,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
                };
                case 900: {
                    _groups = [_pos,((getMarkerSize _marker) + [markerDir _marker]),[13,true],[3,false],[0,false],[3,false],[2,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
                };
            };
        };
    };

    {
        ((virtualizedArray select _x) select 3) set [0,currentGroupID];
        assignedArray pushBack [currentGroupID,_index];
        currentGroupID = currentGroupID + 1;
    } forEach (_groups + _groupsB);

    (strategicArray select _forEachIndex) set [5,_index];

} forEach strategicArray;

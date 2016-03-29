/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    _pos = _x select 0;
    _priority = _x select 1;
    _type = _x select 2;
    _marker = _x select 3;

    switch (_type) do {
        case "aa": {
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[3,true],[1,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "radar": {
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[6,true],[2,false],[0,false],[2,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "airfield":{
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[11,true],[4,false],[0,false],[3,false],[2,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "arty": {
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[3,true],[1,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "base": {
            [_pos,300]call JOC_cmdSpawnBase;
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[(_priority / 300),true],[(_priority / 600),false],[0,false],[(_priority / 800),false],[(_priority / 1000),false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "camp": {
            [_pos,([5,5] + [markerDir _marker]),[1,true],[0,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "outpost": {
            [_pos,50]call JOC_cmdSpawnBase;
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[2,true],[0,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "factory": {
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[6,true],[2,false],[0,false],[2,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "radio":{
            [_pos,((getMarkerSize _marker) + [markerDir _marker]),[3,true],[1,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
        };
        case "town": {
            switch (_priority) do {
                case 300: {
                    [_pos,((getMarkerSize _marker) + [markerDir _marker]),[4,true],[2,false],[0,false],[0,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
                };
                case 500: {
                    [_pos,((getMarkerSize _marker) + [markerDir _marker]),[9,true],[2,false],[0,false],[2,false],[0,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
                };
                case 900: {
                    [_pos,((getMarkerSize _marker) + [markerDir _marker]),[14,true],[4,false],[0,false],[3,false],[2,false],[0,false,"cas"],[0,false]] call JOC_cmdSpawnZone;
                };
            };
        };
    };

    //Delete these lines and ArmA has a memory crash
    {
        [_x]call JOC_virtualize;
    } forEach cachedArray;

} forEach strategicArray;

diag_log strategicArray;

[]spawn JOC_cmdCmdLoop;

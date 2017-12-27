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
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [2, true], [1, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "radar": {
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [3, true], [1, false], [0, false], [1, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "airfield":{
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [8, true], [3, false], [0, false], [2, false], [1, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "arty": {
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [3, true], [1, false], [0, false], [1, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "base": {
            _groupsB = [_pos, 300] call JOC_spawnBase;
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [3, true], [2, false], [0, false], [1, false], [1, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "camp": {
            _groups = [_pos, ([5, 5] + [markerDir _marker]), [1, true], [0, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "outpost": {
            _groupsB = [_pos, 50] call JOC_spawnBase;
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [2, true], [1, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "factory": {
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [4, true], [2, false], [0, false], [1, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "radio":{
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [2, true], [1, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "roadblock":{
            _groupsB = [_pos, 50] call JOC_spawnBase;
            _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [1, true], [0, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
        };
        case "town": {
            switch (_priority) do {
                case 300: {
                    _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [2, true], [1, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
                };
                case 500: {
                    _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [5, true], [2, false], [0, false], [1, false], [0, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
                };
                case 900: {
                    _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [7, true], [3, false], [0, false], [2, false], [1, false], [0, false, "cas"], [0, false]] call JOC_spawnZone;
                };
            };
        };
    };

    {
        assignedArray pushBack [_x, _index];
    } forEach (_groups + _groupsB);

    _x set [5, _index];

} forEach strategicArray;

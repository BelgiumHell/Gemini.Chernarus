/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array"];
_strategicEast = strategicArray select {(_x select 4) == 1};
_strengthEast = (count _strategicEast) / (count strategicArray);

_index = _forEachIndex;
_pos = _array select 0;
_priority = _array select 1;
_type = _array select 2;
_marker = _array select 3;

_groups = [];
_groupsB = [];

switch (_type) do {
    case "aa": {
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [3 * _strengthEast, true], [1 * _strengthEast, false], [0 * _strengthEast, false], [0 * _strengthEast, false], [0 * _strengthEast, false], [0 * _strengthEast, false, "cas"], [0 * _strengthEast, false]] call JOC_cmdSpawnZone;
    };
    case "radar": {
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [6 * _strengthEast, true], [2 * _strengthEast, false], [0, false], [2 * _strengthEast, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "airfield":{
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [11 * _strengthEast, true], [4 * _strengthEast, false], [0, false], [3 * _strengthEast, false], [2 * _strengthEast, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "arty": {
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [4 * _strengthEast, true], [1 * _strengthEast, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "base": {
        _groupsB = [_pos, 300] call JOC_cmdSpawnBase;
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [8 * _strengthEast, true], [2 * _strengthEast, false], [0, false], [2, false], [1, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "camp": {
        _groups = [_pos, ([5, 5] + [markerDir _marker]), [1 * _strengthEast, true], [0, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "outpost": {
        _groupsB = [_pos, 50] call JOC_cmdSpawnBase;
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [2 * _strengthEast, true], [0, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "factory": {
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [6 * _strengthEast, true], [2 * _strengthEast, false], [0, false], [2 * _strengthEast, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "radio":{
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [3 * _strengthEast, true], [1 * _strengthEast, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "roadblock":{
        _groupsB = [_pos, 50] call JOC_cmdSpawnBase;
        _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [1 * _strengthEast, true], [0, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
    };
    case "town": {
        switch (_priority) do {
            case 300: {
                _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [2 * _strengthEast, true], [1 * _strengthEast, false], [0, false], [0, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
            };
            case 500: {
                _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [7 * _strengthEast, true], [3 * _strengthEast, false], [0, false], [1 * _strengthEast, false], [0, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
            };
            case 900: {
                _groups = [_pos, ((getMarkerSize _marker) + [markerDir _marker]), [13 * _strengthEast, true], [6 * _strengthEast, false], [0, false], [3 * _strengthEast, false], [2 * _strengthEast, false], [0, false, "cas"], [0, false]] call JOC_cmdSpawnZone;
            };
        };
    };
};

{
    assignedArray pushBack [_x, _index];
} forEach (_groups + _groupsB);


/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_pos", "_unitCount", "_pool", "_garrison", "_skill"];

_poolCur = poolInfantry;

switch(_pool)do{
    case 0: {
        _poolCur = poolInfantry;
    };
    case 1: {
        _poolCur = poolSf;
    };
    case 2: {
        _poolCur = [classCrew];
    };
};

_unitClasses = [];
_posArr = [];

if (_garrison select 0) then {
    _posArrOrg = ((_garrison select 1) buildingPos - 1);
    if (count _posArrOrg != 0) then {
        _posArr = [_posArrOrg select ((count _posArrOrg) - 1)];
        _posArrOrg deleteAt ((count _posArrOrg) - 1);
        _posArr append (_posArrOrg call BIS_fnc_arrayShuffle);
    };
};

_groupId = currentGroupID;
currentGroupID = currentGroupID + 1;

_i = 0;
while{_i < _unitCount}do{
    if (_garrison select 0) then {
        if (count _posArr <= _i) then {
            _posArr pushBack (AGLToASL ((getPos (_garrison select 1)) findEmptyPosition [0, 500]));
        };
        [_groupId, AGLToASL (_posArr select _i), [-1, [0, 0]], (selectRandom _poolCur), true, 0, 0.5, east, "SAFE", true] call JOC_spawnUnit;
    }else{
        [_groupId, _pos, [-1, [0, 0]], (selectRandom _poolCur), true, 0, 0.5, east, "SAFE"] call JOC_spawnUnit;
    };
    _i = _i + 1;
};

_groupId
/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_group"];

//No vehicles as they can't manage to drive past infantry
_vehicle = false;
{
    if (!isNull (objectParent _x))exitWith{
        _vehicle = true;
    };
} forEach (units _group);

if (_vehicle)exitWith{};

_id = [_group] call JOC_coreGetId;
_assignedArr = assignedArray select {(_x select 0) == _id};
if (count _assignedArr == 0)exitWith{};
_assigned = _assignedArr select 0;

_strategic = strategicArray select (_assigned select 1);
_pos = _strategic select 0;
_size = (getMarkerSize (_strategic select 2)) select 0;

if (_size < 300) then {
    _size = 300;
};

[_group, _pos, _size, "SAFE"] call JOC_cmdPatrolArea;
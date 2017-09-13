/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_intId"];

_group = grpNull;

_groups = (allGroups select {[_x] call JOC_coreGetId == _intId});
if (count _groups > 0) then {
    _group = _groups select 0;
};

_group

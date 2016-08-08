/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_groupID"];
_group = grpNull;
{
    if(_x getVariable["groupID",-1] == _groupID)then{
        _group = _x;
    };
} forEach allGroups;

_group

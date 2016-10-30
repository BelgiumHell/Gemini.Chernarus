/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_groupID"];
_exists = false;
_group = grpNull;
_group = [_groupID]call JOC_getGroup;

if(isNull _group)then{
    _existsArr =  virtualizedArray select {((_x select 3) select 0 )== _groupID};
    if(count _existsArr > 0)then{
        _exists = true;
    };
}else{
    _exists = true;
};

_exists

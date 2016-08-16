/////////////////////////
//Script made by Jochem//
/////////////////////////
//caching
if(JOC_pauseCache)exitWith{};
{
    if(count (units _x) == 0)then{
        deleteGroup _x;
    };
    if((_x getVariable ["groupID", -1]) == -1)then{
        [_x]call JOC_setGroupID;
    };
    if(side _x != west)then{
        if(!([getPosASL (leader _x), 1100, ["plane"]]call JOC_playersNear))then{
            if(_x getVariable ["JOC_cleanUp",false])then{
                [_x]call JOC_cleanUp;
            }else{
                [_x]call JOC_virtualize;
            };
        };
    };
} forEach allGroups;

//Unvirtualizing
{
    if(isNil{_x select 3} || (_x select 3 == -1))then{
        _x set [3,currentGroupID];
        currentGroupID = currentGroupID + 1;
    };
    if(count (_x select 0) == 0)then{
        virtualizedArray deleteAt _forEachIndex;
    }else{
        if([(((_x select 0) select 0) select 1), 1100, ["plane"]]call JOC_playersNear || (_x select 2))then{
            [_x]call JOC_unVirtualize;
            virtualizedArray deleteAt _forEachIndex;
        };
    };
} forEach virtualizedArray;

/////////////////////////
//Script made by Jochem//
/////////////////////////
//caching
if(JOC_pauseCache)exitWith{};
{
    if(count (units _x) == 0)then{
        deleteGroup _x;
    };
    if(side _x != west)then{
        if(!([getPosASL (leader _x), 1100, ["plane"]]call JOC_playersNear))then{
            [units _x]call JOC_virtualize;
        };
    };
} forEach allGroups;

//Unvirtualizing
{
    if(count (_x select 0) == 0)then{
        _x deleteAt _forEachIndex;
    }else{
        if([(((_x select 0) select 0) select 1), 1100, ["plane"]]call JOC_playersNear || (_x select 3))then{
            [_x]call JOC_unVirtualize;
            _x deleteAt _forEachIndex;
        };
    };
} forEach virtualizedArray;

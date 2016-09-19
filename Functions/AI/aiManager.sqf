/////////////////////////
//Script made by Jochem//
/////////////////////////
//virtualizing
if(JOC_pauseCache)exitWith{};
{
    if(count (units _x) == 0)then{
        deleteGroup _x;
    };
    if((_x getVariable ["groupID", -1]) == -1)then{
        [_x]call JOC_setGroupID;
    };
    if(side _x != west)then{
        if(!([getPosASL (leader _x), 1100, []]call JOC_playersNear))then{
            if(_x getVariable ["JOC_cleanUp",false])then{
                [_x]call JOC_cleanUp;
            }else{
                _array = [_x,true]call JOC_virtualize;
                if(count _array != 0)then{
                    virtualizedArray pushBack _array;
                };
            };
        };
    };
} forEach allGroups;

//Unvirtualizing
{

    if(count _x == 0 || typeName _x != "ARRAY")then{
        virtualizedArray deleteAt _forEachIndex;
    }else{
        if(count (_x select 0) == 0)then{
                virtualizedArray deleteAt _forEachIndex;
        }else{
            if(isNil{(_x select 3) select 0} || ((_x select 3) select 0 == -1))then{
                (_x select 3) set [0,currentGroupID];
                currentGroupID = currentGroupID + 1;
            };
            if([(((_x select 0) select 0) select 1), 1100, ["plane"]]call JOC_playersNear || (_x select 2))then{
                [_x]call JOC_unVirtualize;
                virtualizedArray deleteAt _forEachIndex;
            }else{

            };
        };
    };
} forEach virtualizedArray;

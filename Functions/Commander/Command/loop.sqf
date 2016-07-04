/////////////////////////
//Script made by Jochem//
/////////////////////////
//Check for AA intercept
if((count jetTargets > 0 || count heliTargets > 1) && !jetActive)then{
    jetActive = true;
    //[]spawn JOC_cmdAttackIntercept;
};

//new
//request = [categoryArray,params,canIgnore]
//order = [categoryArray,params,groupID,scriptArray]
//categoryArray = [category,subcategory,...]
//scriptArray = [[condition,code],[condition,code],...]

//The brain of the ai commander
_realGroups = [];
_usedGroups = [];
{
    if(side _x != west)then{
        //Another failsafe for groupID
        if((_x getVariable ["groupID", -1]) == -1)then{
            [_x]call JOC_setGroupID;
        };

        _id = (_x getVariable ["groupID", -1]);
        _realGroups pushBack _id;
    };
} forEach allGroups;


{
    _request = _x;
    _order = [];

    switch ((_request select 0) select 0) do {
        //Attack
        case (0): {

        };
        //Defend
        case (1): {

        };
        //Logistics
        case (2): {
            switch ((_request select 0) select 1) do {
                //Ammo supply
                case (0): {
                    _order = [(_task select 1)]call JOC_cmdLogAmmo;
                };
                //Repair
                case (1): {
                    _order = [(_task select 1)]call JOC_cmdLogRepair;
                };
            };
        };
        //Support
        case (3): {

        };
    };

    if(count _order != 0)then{
        orderArray pushBack _order;
        requestArray deleteAt _forEachIndex;
    }else{
        if(_request select 2)then{
            requestArray deleteAt _forEachIndex;
        };
    };
} forEach requestArray;


{
    _order = _x;

    //If condition is met, execute code
    if(isNil{(((_order select 3) select 0) select 0)})then{
        orderArray deleteAt _forEachIndex;
    }else{
        _usedGroups pushBack (_order select 2);
        if([_order select 1, _order select 2]call (compile (((_order select 3) select 0) select 0)))then{
            [_order select 1, _order select 2]call (compile (((_order select 3) select 0) select 1));
            ((_order select 3) select 0) deleteAt 0;
        };
    };

} forEach orderArray;


{
    _group = [_x]call JOC_getGroup;
    if(count (waypoints _group) == 0 && !(_x in _usedGroups))then{
        [_x]call JOC_cmdPatrolArea;
    };
} forEach _realGroups;

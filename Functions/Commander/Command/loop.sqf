/////////////////////////
//Script made by Jochem//
/////////////////////////
//Check for AA intercept
/*if((count jetTargets > 0 || count heliTargets > 1) && !jetActive)then{
    jetActive = true;
    //[]spawn JOC_cmdAttackIntercept;
};*/

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

    switch((_request select 0) select 0)do{
        //Attack
        case (0): {

        };
        //Defend
        case (1): {
            switch((_request select 0) select 1)do{
                //Armor
                case (0): {
                    _order = [(_task select 1)]call JOC_cmdDefArmor;
                };
                //Cas
                case (1): {
                    _order = [(_task select 1)]call JOC_cmdDefCas;
                };
                //Convoy
                case (2): {
                    _order = [(_task select 1)]call JOC_cmdDefConvoy;
                };
                //Heli
                case (3): {
                    _order = [(_task select 1)]call JOC_cmdDefHeli;
                };
                //Near
                case (4): {
                    //_order = [(_task select 1)]call JOC_cmdDefNear;
                };
                //Retreat
                case (5): {
                    //_order = [(_task select 1)]call JOC_cmdDefRetreat;
                };
            };
        };
        //Logistics
        case (2): {
            switch((_request select 0) select 1)do{
                //Ammo supply
                case (0): {
                    _order = [(_task select 1)]call JOC_cmdLogAmmo;
                };
                //Repair
                case (1): {
                    //_order = [(_task select 1)]call JOC_cmdLogRepair;
                };
            };
        };
        //Support
        case (3): {

        };
    };

    if(count _order != 0)then{
        orderArray append _order;
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
        if(_order select 2 in _realGroups)then{
            _usedGroups pushBack (_order select 2);
            _group = [_order select 2]call JOC_getGroup;
            if([_order select 1, _group]call (compile (((_order select 3) select 0) select 0)))then{
                [_order select 1, _group]call (compile (((_order select 3) select 0) select 1));
                ((_order select 3) select 0) deleteAt 0;
            };
        };
    };
} forEach orderArray;


{
    _group = [_x]call JOC_getGroup;
    if((count (waypoints _group) < 2) && !(_x in _usedGroups) && !(_group getVariable["JOC_caching_disabled",false]) && (combatMode _group != "COMBAT"))then{
        [_group]call JOC_cmdPatrolStrategic;
    };
} forEach _realGroups;

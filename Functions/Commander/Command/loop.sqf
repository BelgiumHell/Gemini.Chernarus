/////////////////////////
//Script made by Jochem//
/////////////////////////
//Check for AA intercept
if((count jetTargets > 0 || count heliTargets > 1) && !jetActive)then{
    jetActive = true;
    jetReady = false;
    requestArray pushBack [[3,1],_array,"true"];
};

if(!jetReady && !jetActive)then{
    [{jetReady = true;}, [], 7200] call CBA_fnc_waitAndExecute;
};

{
    switch(_x select 4)do{
        case 0:{
            if(_x select 2 in ["aa","arty","camp"])then{
                (strategicArray select _forEachIndex) set [4,4];
            }else{
                if(_x select 2 in ["radar","radio"])then{

                };
            };
        };
        case 1:{
            //Check if under attack
            if([(_x select 0),(_x select 1),["air"],[true,east]]call JOC_nearestPlayers)then{
                (strategicArray select _forEachIndex) set [4,2];
            }else{
                //Check if vehicles need ammo
                if(_x select 2 in ["aa","arty"])then{
                    _vehicles = (_x select 0) nearEntities [[aaClass,artyClass],(_x select 1)];
                    _ammo = _vehicles select {_x ammo (currentWeapon _x) < 0.3};
                    if(count _ammo > 0)then{
                        [[2,0],_x,_forEachIndex,false]call JOC_cmdCmdRequest;
                    };
                };
            };
        };
    };
}forEach strategicArray;


_strategicWest = strategicArray select {(_x select 4) == 0};
_strategicEast = strategicArray select {(_x select 4) == 1};
_strategicDefend = strategicArray select {(_x select 4) == 2};
_strategicAttack = strategicArray select {(_x select 4) == 3};

_strengthEast = (count _strategicEast) / (count strategicArray);
_strenghtWest = (count _strategicWest) / (count strategicArray);
/*
{
    _array = _x;
    _index = _array select 5;
    switch(true)do{
        case(_array select 1 >= 1000):{
            requestArray pushBack [[1,0],_array,format["(strategicArray select %1) select 4 == 1",_index]];
            requestArray pushBack [[1,1],_array,format["(strategicArray select %1) select 4 == 1",_index]];
            if(random 2 >= 1)then{
                requestArray pushBack [[1,2],[_array,4],format["(strategicArray select %1) select 4 == 1",_index]];
            }else{
                requestArray pushBack [[1,3],_array,format["(strategicArray select %1) select 4 == 1",_index]];
            };
        };
        case(_array select 1 >= 800 && _array select 1 < 1000):{
            if(random 2 >= 1)then{
                requestArray pushBack [[1,0],_array,format["(strategicArray select %1) select 4 == 1",_index]];
            }else{
                requestArray pushBack [[1,1],_array,format["(strategicArray select %1) select 4 == 1",_index]];
            };
            if(random 2 >= 1)then{
                requestArray pushBack [[1,2],[_array,3],format["(strategicArray select %1) select 4 == 1",_index]];
            }else{
                requestArray pushBack [[1,3],_array,format["(strategicArray select %1) select 4 == 1",_index]];
            };
        };
        case(_array select 1 >= 600 && _array select 1 < 800):{
            if(_strengthEast > 0.2)then{
                if(_strengthEast > 0.4)then{
                    requestArray pushBack [[1,2],[_array,2.5],format["(strategicArray select %1) select 4 == 1",_index]];
                }else{
                    requestArray pushBack [[1,2],[_array,1.5],format["(strategicArray select %1) select 4 == 1",_index]];
                };
            };
        };
        case(_array select 1 >= 400 && _array select 1 < 600):{
            if(_strengthEast > 0.25)then{
                if(_strengthEast > 0.5)then{
                    requestArray pushBack [[1,2],[_array,2],format["(strategicArray select %1) select 4 == 1",_index]];
                }else{
                    requestArray pushBack [[1,2],[_array,1],format["(strategicArray select %1) select 4 == 1",_index]];
                };
            };
        };
        case(_array select 1 >= 200 && _array select 1 < 400):{
            if(_strengthEast > 0.3)then{
                if(_strengthEast > 0.6)then{
                    requestArray pushBack [[1,2],[_array,1.5],format["(strategicArray select %1) select 4 == 1",_index]];
                }else{
                    requestArray pushBack [[1,2],[_array,0.5],format["(strategicArray select %1) select 4 == 1",_index]];
                };
            };
        };
        case(_array select 1 >= 100 && _array select 1 < 200):{
            if(_strengthEast > 0.6)then{
                requestArray pushBack [[1,2],[_array,1],format["(strategicArray select %1) select 4 == 1",_index]];
            };
        };
        case(_array select 1 >= 0 && _array select 1 < 100): {
            //requestArray pushBack [[1,5],_array,format["(strategicArray select %1) select 4 == 1",_index]];
        };
    };
} forEach _strategicDefend;
*/

//new
//request = [categoryArray,params,canIgnore]
//order = [categoryArray,params,groupID,scriptArray]
//categoryArray = [category,subcategory,...]
//scriptArray = [[condition,code],[condition,code],...]

//The brain of the ai commander
_realGroups = [];
_usedGroups = [];
{
    if((side _x) != west)then{
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

    //If request hasn't been processed yet, do that
    if(!((_request select 3) select 1))then{
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
                switch((_request select 0) select 1)do{
                    //Arty support
                    case (0): {
                        //_order = [(_task select 1)]call JOC_cmdLogAmmo;
                    };
                    //Intercept
                    case (1): {
                        _order = [(_task select 1)]call JOC_cmdSupportIntercept;
                    };
                };
            };
        };

        //If order didn't fail to start, start execution of order
        if(count _order != 0)then{
            {
                orderArray pushBack [_order,currentRequestID];
            } forEach _order;

            (requestArray select _forEachIndex) set [3,[currentRequestID,true]];
            currentRequestID = currentRequestID + 1;
        };
    }else{
        //If order that was activated by request is complete, delete request
        _existArr = orderArray select {_x select 1 == ((_request select 3) select 0)};
        if(count _existArr == 0)then{
            requestArray deleteAt _forEachIndex;
        };
    };
} forEach requestArray;


{
    _order = _x select 0;

    //If no more conditions or group is destoyed, delete from orderarray
    if(isNil{(((_order select 3) select 0) select 0)} || !([_order select 2]call JOC_groupExists))then{
        orderArray deleteAt _forEachIndex;
    }else{
        //If group isn't virtuaized, evaluate condition
        if(_order select 2 in _realGroups)then{
            _usedGroups pushBack (_order select 2);
            _group = [_order select 2]call JOC_getGroup;
            //If condition is true, execute code and delete part from order
            if([_order select 1, _group]call (compile (((_order select 3) select 0) select 0)))then{
                [_order select 1, _group]call (compile (((_order select 3) select 0) select 1));
                ((_order select 3) select 0) deleteAt 0;
            };
        };
    };
} forEach orderArray;

//Patrol
{
    _group = [_x]call JOC_getGroup;
    if((count (waypoints _group) <= currentWaypoint _group) && !(_x in _usedGroups) && !(_group getVariable["JOC_caching_disabled",false]) && !(_group getVariable["garrisoned",false]) && (combatMode _group != "COMBAT"))then{
        [_group]call JOC_cmdPatrolStrategic;
    };
} forEach _realGroups;

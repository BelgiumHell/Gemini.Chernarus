/////////////////////////
//Script made by Jochem//
/////////////////////////
//Check for AA intercept
if((count jetTargets > 0 || count heliTargets > 1) && !jetActive)then{
    jetActive = true;
    //[]spawn JOC_cmdAttackIntercept;
};

//[groupID,[category,task],active,unvirtualize,completed]
//task = [type,[params],canIgnore]
//0:Attack 1:Defend 2:Logistics 3:Support
//The brain of the ai commander

/*
This is how it works: you need something done from the AI -> create a request
Task gets evaluated and put into orderArray if execution is possible
New units that will execute the order need to be spawned by this script NOT the task script
Here you go, task will be executed and it is (almost, some task will start from the beginning for now, like slingloading ammo) savefile compatible
*/
_realGroups = [];
{
    if(side _x != west)then{
        _id = (_x getVariable ["groupID", -1]);
        if(_id = -1)then{
            _group setVariable["groupID",currentGroupID];
            _id = currentGroupID;
            currentGroupID = currentGroupID + 1;
        };
        _realGroups pushBack _id;
    };
} forEach allGroups;

_attackRequest = [];
_defendRequest = [];
_logisticsRequest = [];
_supportRequest = [];
{
    _request = _x;
    switch (_request select 0) do {
        case (0): {
            _attackRequest pushBack [(_request select 1),_forEachIndex];
        };
        case (1): {
            _defendRequest pushBack [(_request select 1),_forEachIndex];
        };
        case (2): {
            _logisticsRequest pushBack [(_request select 1),_forEachIndex];
        };
        case (3): {
            _supportRequest pushBack [(_request select 1),_forEachIndex];
        };
    };
} forEach requestArray;


{

} forEach _attackRequest;

{

} forEach _defendRequest;

{
    _task = _x select 0;

    switch (_task select 0) do {
        //Ammo supply
        case (0): {
            _array = (_task select 1);
            _pos = _array select 0;

            if(!([getPosASL (leader _x), 2000, ["plane"]]call JOC_playersNear))then{
                //Get nearest base
                _startPos = [(_array select 0),"base",1200]call JOC_cmdMiscGetNearestStrategic;
                if(count (_startPos - [0,0,0]) != 0)then{

                    //Generate composition
                    _vehArr = [];
                    _vehArr pushBack (apcPool call BIS_fnc_selectRandom);
                    {
                        _vehArr pushBack _x;
                    } forEach supportPool;

                    //Spawn convoy
                    _groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
                    _groupConvoy setVariable["groupID",currentGroupID];
                    _id = currentGroupID;
                    currentGroupID = currentGroupID + 1;

                    //Create task
                    orderArray pushBack [_id,[2,_task],false,true,false];
                    requestArray deleteAt (_x select 1);
                }else{
                    _airfieldPos = [(_array select 0),"airfield",500]call JOC_cmdMiscGetNearestStrategic;
                    _basePos = [(_array select 0),"base",500]call JOC_cmdMiscGetNearestStrategic;
                    if(count (_basePos - [0,0,0]) != 0 && count (_airfieldPos - [0,0,0]) != 0 && !([getPosASL (leader _x), 500, ["plane"]]call JOC_playersNear))then{
                        //Spawn heli
                        _list = nearestObjects [_airfieldPos, ["LocationRespawnPoint_F"], 2000];
                        _posHeli = getPos (_list select 0);
                        _heli = [_posHeli,(airPool call BIS_fnc_selectRandom),0] call Zen_SpawnHelicopter;
                        (group _heli) setVariable["groupID",currentGroupID];
                        _id = currentGroupID;
                        currentGroupID = currentGroupID + 1;

                        //Create task
                        orderArray pushBack [_id,[2,_task],false,true,false];
                        requestArray deleteAt (_x select 1);
                    };
                };
            }else{
                if(_task select 2)then{
                    requestArray deleteAt (_x select 1);
                };
            };
        };
    };
} forEach _logisticsRequest;

{

} forEach _supportRequest;





{
    _order = _x;
    _group = grpNull;

    //Recheck if active
    if((_order select 2) && !((_order select 0) in _realGroups))then{
        _order set[2,false];
    }else{
        _group = [(_order select 0)]call JOC_getGroup;
    };
    //Disable virtualizing
    if(_order select 3)then{
        if(isNull _group)then{
            {
                if((_x select 3) == (_order select 0))then{
                    _x set [2,true];
                    [_x]call JOC_unVirtualize;
                };
            } forEach virtualizedArray;
        }else{
            _group setVariable["JOC_caching_disabled",true];
        };
    //Check if already completed
    if(_order select 4)then{
        //Enable caching for group after task complete
        {
            if(_x getVariable["groupID",-1] == (_order select 2))then{
                _group setVariable["JOC_caching_disabled",false];
            };
        } forEach allGroups;

        //Remove task
        orderArray deleteAt _forEachIndex;
    }else{
        if((_order select 0) in _realGroups)then{
            //Execute order, script that's called should check if for progress


            //Check category
            switch ((_order select 1) select 0) do {
                //Attack
                case (0): {
                    switch (((_order select 1) select 1) select 0) do {
                        case (0): {
                            //code
                        };
                    };
                };
                //Defend
                case (1): {
                    switch (((_order select 1) select 1) select 0) do {
                        //cases (insertable by snippet)
                    };
                };
                //Logistics
                case (2): {
                    switch (((_order select 1) select 1) select 0) do {
                        case (0): {
                            [_group,(((_order select 1) select 1) select 1),_forEachIndex]call JOC_cmdLogSupply;
                        };
                    };
                };
                //Support
                case (3): {
                    switch (((_order select 1) select 1) select 0) do {
                        //cases (insertable by snippet)
                    };
                };
            };
        };
    };



} forEach orderArray;
    //Assault blufor positions

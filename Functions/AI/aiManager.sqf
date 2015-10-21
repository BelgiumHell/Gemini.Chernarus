/////////////////////////
//Script made by Jochem//
/////////////////////////

cacheGroup = createGroup east;
[cacheGroupLeader] joinSilent cacheGroup;
cacheGroup selectLeader cacheGroupLeader;
publicVariable "cacheGroupLeader";
cachedArray = [];
virtualizedArray = [];

//For caching
[]spawn{
    while{true}do{
        {
            if(side _x != west)then{
                if(_x != cacheGroup)then{
                    _objects = nearestObjects [(getPos (leader _x)),["Man","Car","Tank"],2000];

                    if ((west countSide _objects) == 0)then{
                        [_x]spawn JOC_cache;
                    };

                };
            };
        } forEach allGroups;
        sleep 15;
    };
};

//uncaching
[]spawn{
    while {true} do {
        {
            _objects = nearestObjects [_x select 0,["Man","Car","Tank"],2000];

            if((west countSide _objects) > 0)then{
                [_x]spawn JOC_unCache;
            }else{
                _objects = nearestObjects [_x select 0,["Man","Car","Tank"],2000];

                if((west countSide _objects) == 0)then{
                    [_x]spawn JOC_virtualize;
                }
            };
        } forEach cachedArray;
        sleep 15;
    };
};

//Virtualizing/unvirtualizing
[]spawn{
    while {true} do {
        {
            _objects = nearestObjects [_x select 0,["Man","Car","Tank"],2000];

            if((west countSide _objects) > 0)then{
                [_x]spawn JOC_unVirtualize;
            };
        } forEach virtualizedArray;
        sleep 30;
    };
};

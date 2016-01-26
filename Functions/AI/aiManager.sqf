/////////////////////////
//Script made by Jochem//
/////////////////////////
//For caching
[]spawn{
    while{true}do{
        waitUntil {sleep 1; (!JOC_pauseCache)};
        {
            if(count (units _x) == 0)then{
                deleteGroup _x;
            };
            if(side _x != west)then{
                if(_x != cacheGroup)then{
                    _objects = nearestObjects [(getPos (leader _x)),["Man","Car","Tank","Air"],2000];

                    if ((west countSide _objects) == 0)then{
                        [_x]call JOC_cache;
                    };

                };
            };
        } forEach allGroups;
        sleep 15;
        waitUntil {sleep 1; (!JOC_pauseCache)};
    };
};

//uncaching
[]spawn{
    while {true} do {
        {
            _objects = nearestObjects [_x select 0,["Man","Car","Tank","Air"],2000];

            if((west countSide _objects) > 0)then{
                [_x]call JOC_unCache;
            }else{
                _objects = nearestObjects [_x select 0,["Man","Car","Tank","Air"],3000];

                if((west countSide _objects) == 0)then{
                    [_x]call JOC_virtualize;
                };
            };
        } forEach cachedArray;
        sleep 15;
        cachedArray = cachedArray - [[]];
    };
};

//Virtualizing/unvirtualizing
[]spawn{
    while {true} do {
        JOC_pauseCache = true;
        {
            _objects = nearestObjects [(((_x select 0) select 0) select 1),["Man","Car","Tank","Air"],3000];

            if((west countSide _objects) > 0)then{
                [_x]call JOC_unVirtualize;
            };
        } forEach virtualizedArray;
        JOC_pauseCache = false;
        sleep 30;
    };
};

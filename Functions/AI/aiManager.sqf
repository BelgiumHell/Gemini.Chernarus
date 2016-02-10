/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
    //caching
    waitUntil {sleep 1; (!JOC_pauseCache)};
    {
        if(count (units _x) == 0)then{
            deleteGroup _x;
        };
        if(side _x != west)then{
            if(_x != cacheGroup)then{
                _objects = (getPos (leader _x)) nearEntities [["Man","Car","Tank","Helicopter"],1200];

                if ((west countSide _objects) == 0)then{
                    [_x]call JOC_cache;
                };
            };
        };
    } forEach allGroups;
    waitUntil {sleep 1; (!JOC_pauseCache)};

    //Unvirtualizing
    {
        _objects = (((_x select 0) select 0) select 1) nearEntities [["Man","Car","Tank","Air"],3000];

        if((west countSide _objects) > 0)then{
            [_x]call JOC_unVirtualize;
        };
    } forEach virtualizedArray;

    //uncahcing + virtualizing
    cachedArray = cachedArray - [[]];
    {
        _objects = _x select 0 nearEntities [["Man","Car","Tank","Helicopter"],1500];

        if((west countSide _objects) > 0)then{
            [_x]call JOC_unCache;
        }else{
            _objects = _x select 0 nearEntities [["Man","Car","Tank","Air"],3000];

            if((west countSide _objects) == 0)then{
                [_x]call JOC_virtualize;
            };
        };
    } forEach cachedArray;
};

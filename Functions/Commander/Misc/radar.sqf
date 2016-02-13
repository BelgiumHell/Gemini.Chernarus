/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_radar"];

_pos = getPosASL _radar;

while{alive _radar}do{
    _objects = _pos nearEntities [["Air"], radarRange];

    {
        if((side _x) == west && !(terrainIntersectASL [getPosASL _x, _pos]))then{
            if(!(_x in heliTargets + jetTargets))then{
                if(_x isKindOf "Helicopter")then{
                    heliTargets pushBack _x;
                }else{
                    jetTargets pushBack _x;
                };
                aaGroup reveal [_x, 4];
            };
        }else{
            jetTargets = jetTargets - [_x];
            heliTargets = heliTargets - [_x];
        };
    } forEach _objects;
    
    publicVariable "jetTargets";
    publicVariable "heliTargets";
    sleep 3;
};

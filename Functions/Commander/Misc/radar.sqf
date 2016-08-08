/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    _radar = _x;

    if(alive _x)then{
        _pos = [(getPosASL _x) select 0, (getPosASL _x) select 1, ((getPosASL _x) select 2) + 10];
        _heliAdd = [];
        _jetAdd = [];
        _remove = [];
        _objects = [];
        {
            if(vehicle _x isKindOf "Air")then{
                _objects pushBackUnique (vehicle _x);
            };
        } forEach allPlayers;
        //_objects = _pos nearEntities [["Air"], radarRange];

        {
            if((side _x) == west && !(terrainIntersectASL [getPosASL _x, _pos]))then{
                if(_x isKindOf "Helicopter")then{
                    heliTargets pushBackUnique _x;
                }else{
                    jetTargets pushBackUnique _x;
                };
                east reveal [_x, 4];
            }else{
                _remove pushBack _x;
            };
        } forEach _objects;

        heliTargets = heliTargets - _remove;
        jetTargets = jetTargets - _remove;
    };
} forEach radars;

publicVariable "jetTargets";
publicVariable "heliTargets";

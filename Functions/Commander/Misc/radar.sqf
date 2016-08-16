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

        {
            _object = _x;
            if((side _object) == west && !(terrainIntersectASL [getPosASL _object, _pos]))then{
                if(_object isKindOf "Helicopter")then{
                    heliTargets pushBackUnique _object;
                }else{
                    jetTargets pushBackUnique _object;
                };

                {
                    _x reveal [_object,4];
                }forEach (allGroups select {side _x == east});
            }else{
                _remove pushBack _object;
            };
        } forEach _objects;

        heliTargets = heliTargets - _remove;
        jetTargets = jetTargets - _remove;
    };
} forEach radarsEast;

publicVariable "jetTargets";
publicVariable "heliTargets";

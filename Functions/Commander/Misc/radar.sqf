/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    _radar = _x;
    _pos = getPosWorld _x;
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
        if((side _x) == west && !(terrainIntersectASL [getPosWorld _x, _pos]))then{
            if(_x isKindOf "Helicopter")then{
                _heliAdd pushBack _x;
            }else{
                _jetAdd pushBack _x;
            };
            aaGroup reveal [_x, 4];
        }else{
            _remove pushBack _x;
        };
    } forEach _objects;

    heliTargets = heliTargets - (_remove - (_heliAdd + _jetAdd));
    jetTargets = jetTargets - (_remove - (_heliAdd + _jetAdd));

    {
        heliTargets pushBackUnique _x;
    } forEach _heliAdd;
    {
        jetTargets  pushBackUnique _x;
    } forEach _jetAdd;
} forEach radars;

publicVariable "jetTargets";
publicVariable "heliTargets";

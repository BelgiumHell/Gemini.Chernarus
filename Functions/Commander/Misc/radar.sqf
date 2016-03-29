/////////////////////////
//Script made by Jochem//
/////////////////////////
_heliAdd = [];
_jetAdd = [];
_remove = [];


while{count radars > 0}do{
    _heliAdd = [];
    _jetAdd = [];
    _remove = [];
    {
        _pos = getPosASL _x;
        _objects = _pos nearEntities [["Air"], radarRange];

        {
            if((side _x) == west && !(terrainIntersectASL [getPosASL _x, _pos]))then{
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
    } forEach radars;

    heliTargets = heliTargets - (_remove - (_heliAdd + _jetAdd));
    jetTargets = jetTargets - (_remove - (_heliAdd + _jetAdd));

    {
        heliTargets pushBackUnique _x;
    } forEach _heliAdd;
    {
        jetTargets  pushBackUnique _x;
    } forEach _jetAdd;

    publicVariable "jetTargets";
    publicVariable "heliTargets";
    sleep 3;
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_radar"];

_pos = getPosASL _radar;

while{alive _radar}do{
    _objects = nearestObjects [_pos, ["Air"], radarRange];

    {
        if(!(terrainIntersectASL [getPosASL _x, _pos]))then{
            airTargets pushBack _x;
        };
    } forEach _objects;
    sleep 10;
};

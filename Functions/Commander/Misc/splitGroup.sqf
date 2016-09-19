/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_group"];

_vehicles = [];
_footUnits = [];
{
    if(isNull (objectParent _x))then{
        _footUnits pushBack _x;
    }else{
        if(!(vehicle _x in _vehicles))then{
            _groupNew = createGroup east;
            [crew (vehicle _x)] joinSilent _groupNew;
            _vehicles pushBack (vehicle _x);
        };
    };
}forEach (units _group);
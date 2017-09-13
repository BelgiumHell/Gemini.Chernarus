/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array"];

_arrayN = [];

{
    if ((typeName _x) in ["STRING","SCALAR","ARRAY"]) then {
        _arrayN pushBack _x;
    }else{
        if ((typeName _x) == "OBJECT") then {
            _arrayN pushBack (typeOf _x);
        }else{
            _arrayN pushBack format ["%1",_x];
        };
    };
} forEach _array;

_arrayN
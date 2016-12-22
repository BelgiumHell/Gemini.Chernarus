/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_arrayO","_arrayN","_type"];

if(_type == 0)then{
    _arrayC = unitArrayChanged;
}else{
    _arrayC = vehicleArrayChanged;
};

_arrayC = 0;

{
    if(!isNil{(_arrayO select _forEachIndex)})then{
        if(!(_x isEqualTo (_arrayO select _forEachIndex)))then{
            _arrayC pushBack _x;
        };
    }else{
        _arrayC pushBack _x;
    };
} forEach _arrayN;

if(_type == 0)then{
    publicVariable "unitArrayChanged";
    {
        {
            _id = _x select 0;
            _arrayT = unitArray select {_x select 0 == _id};
            if(count _arrayT > 0)then{
                _arrayT set[0,_x];
            }else{
                unitArray pushBack _x;
            };
        }forEach unitArrayChanged;
    } remoteExecCall ["bis_fnc_call", 0]; 
}else{
    publicVariable "vehicleArrayChanged";
    {
        {
            _id = _x select 0;
            _arrayT = vehicleArray select {_x select 0 == _id};
            if(count _arrayT > 0)then{
                _arrayT set[0,_x];
            }else{
                vehicleArray pushBack _x;
            };
        }forEach vehicleArrayChanged;
    } remoteExecCall ["bis_fnc_call", 0]; 
};
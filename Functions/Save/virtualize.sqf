/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

_vehicles = [];
_vehiclesTemp = [];
{
    if(!(isNull objectParent _x))then{
        if(!((vehicle _x) in _vehiclesTemp))then{
            _vehicles pushBack [(getPos (vehicle _x)),(typeOf (vehicle _x)),[_forEachIndex]];
            _vehiclesTemp pushBack (vehicle _x);
        }else{
            _index = _vehiclesTemp find (vehicle _x);
            (_vehicles select _index select 2) pushBack _forEachIndex;
        };
    };
    //_vehicles
} forEach _units;

_unitClasses = [];
{
    _unitClasses pushBack [(typeOf _x),getPos _x];
} forEach _units;

_caching = false;
if((_units select 0) getVariable "JOC_caching_disabled")then{
    _caching = true,
};

_array = [_unitClasses,_vehicles,_caching];

_array

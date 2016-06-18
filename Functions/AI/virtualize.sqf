/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_group"];

_units = units _group;
if(_group getVariable "JOC_caching_disabled")exitWith{};

_vehicles = [];
_vehiclesTemp = [];
{
    if(!(isNull objectParent _x))then{
        if(!((vehicle _x) in _vehiclesTemp))then{
            _vehicle = (vehicle _x);
            //Damage values
            _damageArray = [[],[]];
            if(count getAllHitPointsDamage (vehicle _x) == 3)then{
                {
                    if(_x != 0)then{
                        _damageArray select 0 pushBack (((getAllHitPointsDamage _vehicle) select 0) select _forEachIndex);
                        _damageArray select 1 pushBack _x;
                    };
                } forEach ((getAllHitPointsDamage _vehicle) select 2);
            };

            _vehicles pushBack [(getPos _vehicle),(typeOf _vehicle),[_forEachIndex],_damageArray, fuel _vehicle];
            _vehiclesTemp pushBack _vehicle;
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
    deleteVehicle _x;
} forEach _units;

{
    deleteVehicle _x;
} forEach _vehiclesTemp;

_array = [_unitClasses,_vehicles,false,_group getVariable "groupID"];
virtualizedArray pushBack _array;

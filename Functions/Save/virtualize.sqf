/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_group"];

if(_group getVariable ["JOC_cleanUp",false])exitWith{_array = []; _array};

_units = units _group;

_vehicles = [];
_vehiclesTemp = [];
{
    if(!(isNull (objectParent _x)))then{
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
} forEach _units;

_caching = false;
if(_group getVariable ["JOC_caching_disabled",false])then{
    _caching = true;
};

_waypoints = [];
{
    _waypoints pushBack[waypointType _x, waypointPosition _x, waypointFormation _x, waypointSpeed _x, waypointStatements _x, waypointBehaviour _x, waypointCompletionRadius _x];
} forEach waypoints _group;
_waypoints deleteAt 0;

_formation = formation _group;
_behaviour = behaviour (leader _group);
_speed = speedMode _group;

_array = [_unitClasses,_vehicles,_caching,_group getVariable "groupID",_waypoints,_formation,_behaviour,_speed];

_array

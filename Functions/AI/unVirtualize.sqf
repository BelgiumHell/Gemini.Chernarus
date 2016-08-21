/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_array"];

_group = createGroup east;
{
    _unit = _group createUnit [(_x select 0), (_x select 1), [], 0, "FORM"];
    _unit setPosASL (_x select 1);
    _unit setSkill (_x select 2);
    if(_unit != leader _group)then{
        doStop _unit;
    };
} forEach (_array select 0);

if(count (_array select 1) > 0)then{
    {
        _vehicle = createVehicle [(_x select 0), (_x select 1), [], 0, "FLY"];
        _vehicle setDir (_x select 5);
        _vehicle setDamage 0;
        _vehicle setPosASL (_x select 1);
        _damageArray = (_x select 3);
        {
            _vehicle setHitPointDamage [_x, ((_damageArray select 1) select _forEachIndex)];
        } forEach (_damageArray select 0);
        _crew = [];
        {
            _crew pushBack ((units _group) select _x);
        } forEach (_x select 2);

        {
            _x moveInDriver _vehicle;
            if(!(_x in _vehicle))then{
                _x moveInGunner _vehicle;
            }else{
                _x moveInCommander _vehicle;
                if(!(_x in _vehicle))then{
                    _x moveInCargo _vehicle
                };
            };
        } forEach _crew;

        _vehicle setFuel (_x select 4);
    } forEach (_array select 1);
};

if(count _array > 2)then{
    _group setVariable ["JOC_caching_disabled", (_array select 2)];
};

if(count _array > 3)then{
    _group setVariable ["groupID", (_array select 3 select 0)];
    _group setVariable ["garrisoned", (_array select 3 select 1)];
}else{
    [_group]call JOC_setGroupID;
};

if(count _array > 4)then{
    {
        _wp = _group addWaypoint [(_x select 1), 0];
        _wp setWaypointType (_x select 0);
        _wp setWaypointFormation (_x select 2);
        _wp setWaypointSpeed (_x select 3);
        _wp setWaypointStatements (_x select 4);
        _wp setWaypointBehaviour (_x select 5);
        _wp setWaypointCompletionRadius (_x select 6);
    } forEach (_array select 4);
};

if(count _array > 5)then{
    _group setFormation (_array select 5);
};

if(count _array > 6)then{
    _group setBehaviour (_array select 6);
};

if(count _array > 7)then{
    _group setSpeedMode (_array select 7);
};

if(!(_group getVariable["garrisoned",false]))then{
    {
        _x doMove getPosASL (leader (group _x));
    }forEach (units _group);
};
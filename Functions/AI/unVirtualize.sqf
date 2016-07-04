/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_array"];

_group = createGroup east;
{
    _unit = _group createUnit [(_x select 0), (_x select 1), [], 0, "FORM"];
} forEach (_array select 0);

if(count (_array select 1) != 0)then{
    {
        _vehicle = createVehicle [(_x select 1), (_x select 0), [], 0, "FLY"];
        //_vehicle = (_x select 1) createVehicle (_x select 0);
        _vehicle setDamage 0;
        _vehicle setFuel (_x select 4);
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
    } forEach (_array select 1);
};

if(!isNil{_array select 2})then{
    if(_array select 2)then{
        _group setVariable ["JOC_caching_disabled", true];
    };
};

if(isNil{_array select 3})then{
    [_group]call JOC_setGroupID;
}else{
    _group setVariable ["groupID", (_array select 3)];
};

{
    _wp = _group addWaypoint [(_x select 1), 0];
    _wp setWaypointType (_x select 0);
    _wp setWaypointFormation (_x select 2);
    _wp setWaypointSpeed (_x select 3);
} forEach (_array select 4);

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
        _vehicle = (_x select 1) createVehicle (_x select 0);
        _vehicle setDamage 0;
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

if(!isNil{_array select 3})then{
    if(_array select 3 )then{
        (leader _group) setVariable ["JOC_caching_disabled", true];
    };
};

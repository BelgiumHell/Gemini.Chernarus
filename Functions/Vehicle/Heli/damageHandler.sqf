/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_vehicle","_part","_damage","_source","_projectile"];

//Check for damage and possible failures
if(_vehicle getHit _part) > 0.6)then{
    [_vehicle,_part]spawn{
        params["_vehicle","_part"];
        sleep (random 1800);
        _vehicle setHit [_part, 1];
    };
};

//If speed < 60 prevent explosion
if(_projectile == "" && speed _vehicle < 60 && speed _vehicle > 20)then{
    _vehicle setDamage 0.9;
    {
        if(random 3 > 2)then{
            _x setDamage 1;
        };
        if(random 3 > 1)then{
            [_x, true, random 600] call ace_medical_fnc_setUnconscious;
        };
    } forEach (crew _vehicle);
    _damage = 0;
};

_damage;

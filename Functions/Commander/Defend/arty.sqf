/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_aimPos"];
private["_array"];
_prevPos = 99999;

hint "start";

{
    if(((_x select 2) == "arty") && (((_x select 0) distance _pos) < _prevPos))then{
        _prevPos = ((_x select 0) distance _pos);
        _array = _x;
    };
} forEach strategicArray;

if(isNil{_array})exitWith{false};

hint "shoot";

_artyA =  nearestObjects [_array select 0,["O_MBT_02_arty_F"],500];

{
    [_x,_aimPos]spawn{
        for [{_i=0}, {_i<4}, {_i=_i+1}] do{
            _shootPos = [((_this select 1) select 0) - 50 + (2 * random 50),((_this select 1) select 1) - 50 + (2 * random 50),0];

            (_this select 0) commandArtilleryFire [_shootPos,getArtilleryAmmo [(_this select 0)] select 0,1];
            sleep 3;
        };
    };
    sleep 2;

} forEach _artyA;

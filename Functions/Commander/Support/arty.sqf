/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos"];

_posUnits = [];
{
    if(((east knowsAbout _x) != 0) && ((_x distance2D _pos) < 1500))then{
        _posUnits pushBack (getPos _x);
    };
} forEach allPlayers;
_posCenter = [_posUnits]call JOC_findCenter;


_artyPos = [_pos,"arty",1200]call JOC_cmdMiscGetNearestStrategic;
if(count (_artyPos - [0,0,0]) == 0)exitWith{false};

_artyA =  nearestObjects [_artyPos,[artyClass],100];

{
    [_x,_posCenter]spawn{
        for [{_i = 0}, {_i < ((count _posUnits) / 4)}, {_i = _i + 1}] do{
            _shootPos = [((_this select 1) select 0) - 50 + (2 * random 50),((_this select 1) select 1) - 50 + (2 * random 50),0];

            (_this select 0) commandArtilleryFire [_shootPos,getArtilleryAmmo [(_this select 0)] select 0,1];
            sleep 3;
        };
    };
    sleep 2;
} forEach _artyA;

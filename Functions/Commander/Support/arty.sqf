/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos"];

_artyPos = [_pos,"arty",[1200,10000]]call JOC_cmdMiscGetNearestStrategic;
if(count (_artyPos - [0,0,0]) == 0)exitWith{false};

_artyA =  nearestObjects [_artyPos,[artyClass],100];

{
    [_x,_pos]spawn{
        for[{_i = 0;}, {_i < (2 + (random 3))}, {_i = _i + 1;}]do{
            _shootPos = [((_this select 1) select 0) - 50 + (2 * random 50),((_this select 1) select 1) - 50 + (2 * random 50),0];

            (_this select 0) doArtilleryFire [_shootPos,getArtilleryAmmo [(_this select 0)] select 0,1];
            sleep 3;
        };
    };
} forEach _artyA;

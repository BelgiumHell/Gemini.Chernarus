/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    if((!canMove (_x select 3) || !alive (_x select 3)) && ((west countSide nearestObjects [getPosWorld (_x select 3), ["men","car","air"], 1000]) == 0))then{
        deleteVehicle (_x select 3);
        _veh = (_x select 0) createVehicle [0,0,1000];
        _veh allowDamage false;
        _veh setDir (_x select 2);
        _veh setPosWorld (_x select 1);
        _veh allowDamage true;
        sleep 1;
        _veh setDamage 0;
        _x set [3,_veh];
    };
} forEach vehArray;

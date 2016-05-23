/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    if((!canMove (_x select 3) || !alive (_x select 3)) && ((west countSide nearestObjects [getPosWorld (_x select 3), ["men","car","air"], 1000]) == 0) && ((civilian countSide nearestObjects [getPosWorld (_x select 3), ["men","car","air"], 1000]) == 0))then{
        deleteVehicle (_x select 3);
        _veh = (_x select 0) createVehicle [0,0,1000];
        _veh allowDamage false;
        _veh setDir (_x select 2);
        _veh setPosWorld (_x select 1);
        _veh allowDamage true;
        _veh setDamage 0;
        _x set [3,_veh];
        
        //Medical heli
        if(_type in ["B_Truck_01_medical_F","rhsusf_m113d_usarmy_medical"])then{
            _veh setVariable ["ace_medical_medicClass", 1];
        };

        //heli
        if(_veh isKindOf "Helicopter")then{
            //[_veh]call ace_fastroping_fnc_equipFRIES;
        };

        //Spawn uav crew
        if(_veh isKindOf "UAV")then{
            createVehicleCrew _veh;
        };

        //Bulldozer
        if(_type in logisticsVehArray)then{
            //[_veh]spawn JOC_tow;
        };

        //Ammo container
        if(_type in ["B_Slingload_01_Ammo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Medevac_F","B_Slingload_01_Cargo_F","B_Slingload_01_Repair_F","B_CargoNet_01_ammo_F"])then{
            [_veh]spawn JOC_crateInit;
        };
    };
} forEach vehArray;

/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    if((!canMove (_x select 3) || !alive (_x select 3)) || !([getPosASL (_x select 3), 2000, ["plane"]]call JOC_playersNear))then{
        deleteVehicle (_x select 3);
        _veh = (_x select 0) createVehicle [0,0,1000];
        _veh allowDamage false;
        _veh setDir (_x select 2);
        _veh setPosASL (_x select 1);
        _veh allowDamage true;
        _veh setDamage 0;
        _x set [3,_veh];

        //Medical heli
        if((_x select 0) in ["B_Truck_01_medical_F","rhsusf_m113d_usarmy_medical"])then{
            _veh setVariable ["ace_medical_medicClass", 1];
        };

        //Custom abrams settings
        if((_x select 0) == "rhsusf_m1a1fep_wd")then{
            _veh animate ["DUKE_Hide",0,true];
            _veh animate ["IFF_Panels_Hide",1,true];

            _veh setVariable ["rhs_ammoslot_1_type", "rhs_mag_M829A3"];
            _veh setVariable ["rhs_ammoslot_2_type", "rhs_mag_M830"];
            _veh setVariable ["rhs_ammoslot_3_type", "rhs_mag_M1069"];

            [_veh,20,"rhs_ammoslot_1"]spawn rhs_fnc_m1_defineLoadout;
            [_veh,12,"rhs_ammoslot_2"]spawn rhs_fnc_m1_defineLoadout;
            [_veh,8,"rhs_ammoslot_3"]spawn rhs_fnc_m1_defineLoadout;
        };

        //heli
        if(_veh isKindOf "Helicopter")then{
            [_veh]call ace_fastroping_fnc_equipFRIES;
        };

        //Spawn uav crew
        if(_veh isKindOf "UAV")then{
            createVehicleCrew _veh;
        };

        //Bulldozer
        if((_x select 0) in logisticsVehArray)then{
            //[_veh]spawn JOC_tow;
        };

        //Ammo container
        if((_x select 0) in ["B_Slingload_01_Ammo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Medevac_F","B_Slingload_01_Cargo_F","B_Slingload_01_Repair_F","B_CargoNet_01_ammo_F"])then{
            [_veh]spawn JOC_crateInit;
        };
    };
} forEach vehArray;

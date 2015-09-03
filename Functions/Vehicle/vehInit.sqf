/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_vehicle"];

_vehicle = _this select 0;
_vehicletype = typeOf _vehicle;
_time = 0;

sleep 1;

_vehicle setDamage 0;

//Blackhwk
if(_vehicletype == "RHS_UH60M")then{
    _time = 600;
};

//Apache
if(_vehicletype == "RHS_AH64D_wd_AA")then{
    _time = 1800;
};

//Medical heli
if(_vehicletype == "RHS_UH60M_MEV")then{
    _time = 1800;
    _vehicle setVariable ["ace_medical_medicClass", 1];
};

//LittleBird
if(_vehicletype == "MELB_AH6M_M")then{
    _time = 1800;
};

//Chinook
if(_vehicletype == "B_Heli_Transport_03_unarmed_F" or _vehicletype == "RHS_CH_47F")then{
    _time = 600;
};

//Tank
if(_vehicletype == "B_MBT_01_cannon_F" or _vehicletype == "rhsusf_m1a2sep1tuskiiwd_usarmy")then{
    _vehicle addEventHandler ["HandleDamage" , {[(_this select 0),(_this select 1), (_this select 2)]call JOC_handleVehDamage;}];
    _vehicle setVariable["burning",false,true];
}];
    cduEnabled = false;
    _time = 1800;
};

//IFV
if(_vehicletype == "RHS_M2A3_BUSKIII_wd" or _vehicleType == "RHS_M6_wd")then{
    _time = 1800;
};

//MRAP
if(_vehicletype == "rhsusf_rg33_m2_wd")then{
    _time = 600;
};

//HMVEE
if(_vehicletype == "rhsusf_m1025_w_s_m2" or _vehicletype == "rhsusf_m1025_w_s_Mk19")then{
    _time = 300;
};

//APC
if(_vehicletype == "rhsusf_m113_usarmy")then{
    _time = 600;
};

//Bulldozer
if(_vehicletype == "B_APC_Tracked_01_CRV_F")then{
    [_vehicle]spawn JOC_tow;
    _time = 600;
};

//Support trucks
if(_vehicletype == "B_Truck_01_fuel_F" or _vehicletype == "B_Truck_01_ammo_F" or _vehicletype == "B_Truck_01_Repair_F")then{
    _time = 600;
};

//Transport truck
if(_vehicletype == "rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy")then{
    _time = 600;
};

//Ammo container
if(_vehicletype == "B_Slingload_01_Ammo_F" or _vehicletype == "B_Slingload_01_Fuel_F" or _vehicletype == "B_Slingload_01_Medevac_F" or _vehicletype == "B_Slingload_01_Cargo_F" or _vehicletype == "B_Slingload_01_Repair_F" or _vehicletype == "B_CargoNet_01_ammo_F")then{
    [_vehicle]spawn JOC_crateInit;
    _time = 300;
};

zeusMod addCuratorEditableObjects [[_vehicle],false];
[_vehicle,_time] spawn JOC_vehRespawn;
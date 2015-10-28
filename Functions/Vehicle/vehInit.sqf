/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_vehicle"];

if(!isServer)exitWith{};

_vehicle = _this select 0;
_vehicletype = typeOf _vehicle;
_time = 0;

sleep 1;
_vehicle setDamage 0;

//Medical heli
if(_vehicletype == "B_Truck_0")then{
    _vehicle setVariable ["ace_medical_medicClass", 1];
};

//Tank
if(_vehicle isKindOf "Helicopter")then{
    [_vehicle]call Zen_AddFastRope;
};

//Bulldozer
if(_vehicletype == "B_APC_Tracked_01_CRV_F")then{
    [_vehicle]spawn JOC_tow;
};

//Ammo container
if(_vehicletype == "B_Slingload_01_Ammo_F" or _vehicletype == "B_Slingload_01_Fuel_F" or _vehicletype == "B_Slingload_01_Medevac_F" or _vehicletype == "B_Slingload_01_Cargo_F" or _vehicletype == "B_Slingload_01_Repair_F" or _vehicletype == "B_CargoNet_01_ammo_F")then{
    [_vehicle]spawn JOC_crateInit;
};

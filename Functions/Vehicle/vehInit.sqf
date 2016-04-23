/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_veh"];

if(!isServer)exitWith{};

_type = typeOf _veh;
_pos = getPosWorld _veh;
_dir = getDir _veh;

deleteVehicle _veh;
_veh = _type createVehicle [0,0,1000];
_veh setDir _dir;
_veh setPosWorld _pos;
_veh setDamage 0;

waitUntil{!isNil{JOC_serverLoaded}};
waitUntil{JOC_serverLoaded};

//Medical heli
if(_type in ["B_Truck_01_medical_F","rhsusf_m113d_usarmy_medical"])then{
    _veh setVariable ["ace_medical_medicClass", 1];
};

//heli
if(_veh isKindOf "Helicopter")then{
    [_veh]call ace_fastroping_fnc_equipFRIES
};

//Bulldozer
if(_type in logisticsVehArray)then{
    //[_veh]spawn JOC_tow;
};

//Ammo container
if(_type in ["B_Slingload_01_Ammo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Medevac_F","B_Slingload_01_Cargo_F","B_Slingload_01_Repair_F","B_CargoNet_01_ammo_F"])then{
    [_veh]spawn JOC_crateInit;
};

vehArray pushBack [_type, _pos, _dir, _veh];

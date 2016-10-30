/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_veh"];
_veh = _this select 0;

{
    _veh vehicleChat "Servicing, vehicle will be ready in 5 minutes";
    _veh setFuel 0;
    sleep 75;

    _veh vehicleChat "Repairing...";
    sleep 75 * (damage _veh);
    _veh setDamage 0;

    _veh vehicleChat "Rearming...";
    sleep 75;

    _veh setVehicleAmmoDef 1;

    _veh vehicleChat "Refueling...";
    sleep 75;
    _veh setFuel 1;

    _veh vehicleChat "Done!";
} forEach crew _veh;

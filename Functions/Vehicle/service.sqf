/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_veh"];
_veh = _this select 0;

_veh vehicleChat "Servicing, please wait...";
_veh setFuel 0;
Sleep 5;

_veh vehicleChat "Repairing...";
Sleep 5;
_veh setDamage 0;

_veh vehicleChat "Rearming...";
Sleep 5;
_veh setVehicleAmmo 1;
if(typeOf _veh == "B_MBT_01_cannon_F" or typeOf _veh == "rhsusf_m1a2sep1wd_usarmy")then{
	_x setVariable ["ammo_left", 4, true];
	_x setVariable ["ammo_right", 4, true];
	_x setVariable ["reloading_left", 0, true];
	_x setVariable ["reloading_right", 0, true];
};

_veh vehicleChat "Refueling...";
Sleep 5;
_veh setFuel 1;

_veh vehicleChat "Done!";
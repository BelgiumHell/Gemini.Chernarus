/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_heli", "_array"];

//Get location
_basePos = [(_array select 0), "base", [500, 99999]] call JOC_cmdMiscGetNearestStrategic;
if (count (_basePos - [0, 0, 0]) == 0) exitWith {false};

//Spawn crate
_location = [];
while {count _location == 0} do {
    _pos = [_basePos, [0, 100]] call Zen_FindGroundPosition;
    _location = _pos findEmptyPosition [0, 300, classEmpty];
};
_crate = "B_CargoNet_01_ammo_F" createVehicle _location;

//Order slingload
_wp1 = (group _heli) addWaypoint [getPosWorld _crate, 0];
_wp1 setWaypointType "HOOK";
_wp1 waypointAttachVehicle _crate;

_wp2 = (group _heli) addWaypoint [(_array select 0), 0];
_wp2 setWaypointType "UNHOOK";
//_wp2 waypointAttachVehicle _crate;

waitUntil{_crate distance2D (_array select 0 ) < 15};
[_crate] spawn{
    params["_crate"];
    sleep 300;
    _objects = (getPos _crate) nearEntities [["Man", "Car", "Tank", "Helicopter"], 200];
    {
        _x setFuel 1;
        _x setVehicleAmmo 1;
        _x setDamage 0;
    } forEach _objects;
    deleteVehicle _crate;
};

//Heli rtb
_heli land "LAND";
waitUntil{(getPosATL _heli) select 2 < 0.5};

//Delete heli
waitUntil{west countSide (_posHeli nearEntities [["Man", "Car", "Tank", "Helicopter"], 1200]) == 0};
{
    deleteVehicle _x;
} forEach crew _heli;
deleteVehicle _heli;

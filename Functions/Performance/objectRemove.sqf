/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    if (count ([getPosASL _x, 1000, []] call JOC_nearestPlayers) == 0 || [_x, "mrk_safeZone"] call Zen_AreInArea) then {
		deleteVehicle _x;
	};
} forEach allDead;

{
    if (count ([getPosASL _x, 2000, []] call JOC_nearestPlayers) == 0 && !([_x, "mrk_safeZone"] call Zen_AreInArea) && count (crew _x) == 0 && !(_x in vehArray)) then {
		deleteVehicle _x;
	};
} forEach vehicles;
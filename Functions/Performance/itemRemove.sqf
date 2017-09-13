/////////////////////////
//Script made by Jochem//
///////////////////////// 
{
    if (count ([getPosASL _x, 1000, []] call JOC_nearestPlayers) == 0) then {
		deleteVehicle _x;
	};
} forEach ((getMarkerPos "mrk_area") nearEntities [["WeaponHolder", "GroundWeaponHolder", "WeaponHolderSimulated", "SmokeShell", "TimeBombCore"], worldSize*2.0^0.5]);
 
{
	deleteVehicle _x;
} forEach ((getMarkerPos "mrk_base") nearEntities [["WeaponHolder", "GroundWeaponHolder", "WeaponHolderSimulated", "SmokeShell", "TimeBombCore"], 100]);

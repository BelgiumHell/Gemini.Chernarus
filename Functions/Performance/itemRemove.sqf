/////////////////////////
//Script made by Jochem//
/////////////////////////
_items = (getMarkerPos "mrk_area") nearEntities [["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], worldSize*2.0^0.5];
{
	_nearestPlayers = [getPosASL _x, 1100, []]call JOC_nearestPlayers;

    if(count _nearestPlayers == 0)then{
		deleteVehicle _x;
	};
}forEach _items;

_items = (getMarkerPos "mrk_base") nearEntities [["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], 100];
{
	deleteVehicle _x;
}forEach _items;

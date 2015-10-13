/////////////////////////
//Script made by Jochem//
/////////////////////////
_items = nearestObjects [(getMarkerPos "mrk_area"), ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], 10000];
{
	_nearestPlayers = [];
	_location = (getPos this);
    {
        if (isPlayer _x && _x distance _location < 500) then {
            _nearestPlayers pushBack _x;
        };
    } forEach (playableUnits + switchableUnits);
    if(count _nearestPlayers == 0)then{
		deleteVehicle _x;
	};
}forEach _items;

_items = nearestObjects [(getMarkerPos "mrk_base"), ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], 100];
{
	deleteVehicle _x;
}forEach _items;
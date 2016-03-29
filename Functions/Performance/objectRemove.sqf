/////////////////////////
//Script made by Jochem//
/////////////////////////
{
	_nearestPlayers = [];
	_location = (getPos _x);
    {
        if (isPlayer _x && _x distance _location < 500) then {
            _nearestPlayers pushBack _x;
        };
    } forEach (playableUnits + switchableUnits);

    if(count _nearestPlayers == 0 or (_x distance respawn_obj) < 100)then{
		deleteVehicle _x;
	};
}forEach allDead;

/////////////////////////
//Script made by Jochem//
/////////////////////////
{
	_nearestPlayers = [];
	_location = (getPos this);
    {
        if (isPlayer _x && _x distance _location < 500) then {
            _nearestPlayers pushBack _x;
        };
    } forEach (playableUnits + switchableUnits);

    if(count _nearestPlayers == 0 or (_x distance respawn_obj) < 100)then{
		_pad = (_x getVariable "pad");
		_pad setVariable["count",((_pad getVariable "count") - 1),true];
		deleteVehicle _x;
	};
}forEach allDead;

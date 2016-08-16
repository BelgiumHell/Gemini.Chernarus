/////////////////////////
//Script made by Jochem//
/////////////////////////
{
	_nearestPlayers = [getPosASL _x, 2000, []]call JOC_nearestPlayers;

    if(count _nearestPlayers == 0 || [_x,"mrk_safeZone"]call Zen_AreInArea)then{
		deleteVehicle _x;
	};
}forEach allDead;

{
	_nearestPlayers = [getPosASL _x, 2000, []]call JOC_nearestPlayers;

    if(count _nearestPlayers == 0 && !([_x,"mrk_safeZone"]call Zen_AreInArea) && count (crew _x) == 0)then{
		deleteVehicle _x;
	};
}forEach vehicles;

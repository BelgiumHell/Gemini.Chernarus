/////////////////////////
//Script made by Jochem//
/////////////////////////
if(side player == west)then{
	player setPosASL getPosASL respawn_obj;
};
if(side player == east)then{
	waitUntil{!isNil{baseMarkers} && !isNil{opTowns}};
	player setPos [worldSize * 3, worldSize * 3, 0];
	player hideObject true;
	_spawnArray = []call JOC_opforGetSpawnLocations;
	[(findDisplay 46), getpos (_this select 1), _spawnArray, [], [], [], 5, true] call BIS_fnc_strategicMapOpen;
	player hideObject false;
};

[]spawn JOC_playerLoop;
cduEnabled = false;
[]spawn JOC_loadoutMaster;

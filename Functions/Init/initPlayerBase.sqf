/////////////////////////
//Script made by Jochem//
/////////////////////////
[[], {
    if (isServer)exitWith{};
    waitUntil{!isNil{JOC_playerInit}};

	_action = cmd_laptop addAction["Gather leaders", {
		{
		    if ([_x, "mrk_safeZone"] call Zen_AreInArea && _x in leaderArray) then {
				hintC "Please gather for briefing";
			};
		} forEach allPlayers;
	}];

	_action = cmd_laptop addAction["Gather everyone", {
		{
		    if ([_x, "mrk_safeZone"] call Zen_AreInArea) then {
				hintC "Please gather for briefing";
			};
		} forEach allPlayers;
	}];

	_action = fobSpawner addAction["Spawn FOB", {
		[[], {
			[] call JOC_fobSpawn;
		}] remoteExec ["BIS_fnc_spawn", 2];
	}];

	{
		[_x] call JOC_arsenal;
	} forEach arsenalBoxes;
}] remoteExec ["BIS_fnc_spawn", 0, true];

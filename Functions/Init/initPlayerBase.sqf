/////////////////////////
//Script made by Jochem//
/////////////////////////
[[],{
	_action = cmd_laptop addAction["Gather leaders",{
		{
		    if([_x,"mrk_safeZone"]call Zen_AreInArea && _x in leaderArray)then{
				hintC "Please gather for briefing";
			};
		} forEach allPlayers;
	}];

	_action = cmd_laptop addAction["Gather everyone",{
		{
		    if([_x,"mrk_safeZone"]call Zen_AreInArea)then{
				hintC "Please gather for briefing";
			};
		} forEach allPlayers;
	}];

	_action = fobSpawner addAction["Spawn FOB",{
		[[],{
			[]call JOC_fobSpawn;
		}] remoteExec ["BIS_fnc_spawn", 2];
	}];

	{
		[_x]call JOC_arsenal;
		_action1 = ["give343", "Get AN/PRC-343", "", {(_this select 1) addItem "ACRE_PRC343"}, {true}] call ace_interact_menu_fnc_createAction;
		_action2 = ["give152", "Get AN/PRC-152", "", {(_this select 1) addItem "ACRE_PRC152"}, {true}] call ace_interact_menu_fnc_createAction;
		_action3 = ["give117", "Get AN/PRC-117F", "", {(_this select 1) addItem "ACRE_PRC117F"}, {true}] call ace_interact_menu_fnc_createAction;
		[_x, 0, ["ACE_MainActions"], _action1]call ace_interact_menu_fnc_addActionToObject;
		[_x, 0, ["ACE_MainActions"], _action2]call ace_interact_menu_fnc_addActionToObject;
		[_x, 0, ["ACE_MainActions"], _action3]call ace_interact_menu_fnc_addActionToObject;
	} forEach arsenalBoxes;
}] remoteExec ["BIS_fnc_spawn", 0, true];

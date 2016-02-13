/////////////////////////
//Script made by Jochem//
/////////////////////////
[[],{
	_action = cmd_laptop addAction["Gather leaders",{
		//[]spawn JOC_setMainTask;
	}];

	_action = cmd_laptop addAction["Gather everyone",{
		//[]spawn JOC_setMainTask;
	}];

	{
		[_x]call JOC_arsenal;
	} forEach arsenalBoxes;
}] remoteExec ["BIS_fnc_spawn", 0, true];

/////////////////////////
//Script made by Jochem//
/////////////////////////
[[],{
	_action = cmd_laptop addAction["Task overview",{
		[]spawn JOC_setMainTask;
	}];
	{
		[_x]call JOC_arsenal;
	} forEach arsenalBoxes;
}] remoteExec ["BIS_fnc_spawn", 0, true];

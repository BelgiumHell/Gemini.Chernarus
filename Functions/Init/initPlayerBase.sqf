/////////////////////////
//Script made by Jochem//
/////////////////////////
[{
	_action = cmd_laptop addAction["Task overview",{
		[]spawn JOC_setMainTask;
	}];
},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

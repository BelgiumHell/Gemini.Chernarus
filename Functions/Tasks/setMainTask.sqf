/////////////////////////
//Script made by Jochem//
/////////////////////////
_tasks = []call JOC_getMainTasks;
[(findDisplay 46), (getMarkerPos "mrk_area"), _tasks, [], [], [], 1, false, 10, true, "Assign a task", false] call BIS_fnc_strategicMapOpen;

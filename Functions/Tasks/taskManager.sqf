/////////////////////////
//Script made by Jochem//
/////////////////////////
taskActive = 0;

convoy = 0;
crash = 0;
kill = 0;
nuke = 0;
rescue = 0;
uavM = 0;

_tasks = ["crash","kill","rescue","uav"];//All (almost)finished tasks are in here

sleep 60;

while{true}do{
    _task = _tasks call BIS_fnc_selectRandom;
    
    if(_task == "convoy" and convoy < 1) then{
        []execVM "Tasks\convoy.sqf";
        taskActive = 1;
        convoy = 5;
    };
    if(_task == "crash" and crash < 1) then{
        []spawn JOC_taskCrash;
        taskActive = 1;
        crash = 4;
    };
    if(_task == "kill" and kill < 1) then{
        []spawn JOC_taskKill;
        taskActive = 1;
        kill = 4;
    };
    if(_task == "nuke" and nuke < 1) then{
        []execVM "Tasks\nuke.sqf";
        taskActive = 1;
        nuke = 8;
    };
    if(_task == "rescue" and rescue < 1) then{
        []spawn JOC_taskRescue;
        taskActive = 1;
        rescue = 3;
    };
    if(_task == "uav" and uavM < 1) then{
        []spawn JOC_taskUav;
        taskActive = 1;
        uavM = 3;
    };
    
    if(taskActive == 1)then{
        convoy = convoy - 1;
        crash = crash - 1;
        kill = kill - 1;
        nuke = nuke - 1;
        rescue = rescue - 1;
        uavM = uavM - 1;
    };
    
    waitUntil{sleep 60;taskActive == 0;};
    Sleep 1200;
};
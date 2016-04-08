/////////////////////////
//Script made by Jochem//
/////////////////////////
[[],{
/*Notes: jetActive is not saved due to techical limitations, all special behaviour scripts are also interrupted. Need to find a way to handle support scripts like convoy/heli insertion*/

    //Enable caching for units that would normally not allow this, needs some adjusting for flying jets/helicopters
    {
        (leader _x) setVariable ["JOC_caching_disabled", false];
    } forEach allGroups;

    [[],{
        hintC "Mission is being saved, all enemies will dissapear and you may experience large frame drops. Mission will be ended after save.";
        player setCaptive true;
    }] remoteExec ["BIS_fnc_spawn", 0, true];

    sleep 60;
    //Delete existing database content
    "delete" call inidbi;

    //Start writing
    //this might be too large for iniDBi to handle, if so look into solution similar to virtualizedArray
    ["write", ["main","strategicArray", strategicArray]] call inidbi;
    {
        ["write", ["main", format["virtualizedArray_%1",_forEachIndex], (_x + [true])]] call inidbi;
    } forEach virtualizedArray;

    _fobArray = [];
    {
        if(locked _x == 2)then{
            _fobArray pushBack [getPosWorld _x, getDir _x, true];
        }else{
            _fobArray pushBack [getPosWorld _x, getDir _x, false];
        };
        deleteVehicle _x;
    } forEach fobTrucks;
    ["write", ["main", "fobArray", _fobArray]] call inidbi;

    _objects = nearestObjects [[worldSize/2,worldSize/2], ["all"], (worldSize*2^0.5)];
    _damageValues = [];
    {
        _damageValues pushBack (damage _x);
    } forEach _objects;
    ["write", ["main", "damageValues", _damageValues]] call inidbi;

    _objectsSpawned = _objects - objectsStart;
    _objectsSpawnedArray = [];
    {
        _objectsSpawnedArray pushBack [typeOf _x, getPosWorld _x, getDir _x];
    } forEach _objectsSpawned;

    [[],{
        endLoadingScreen;
        hintC "Progress saved";
        sleep 10;
        endMission "end1";
    }] remoteExec ["BIS_fnc_spawn", 0, true];
}] remoteExec ["BIS_fnc_spawn", 2];

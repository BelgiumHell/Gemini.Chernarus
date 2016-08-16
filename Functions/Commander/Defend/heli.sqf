params["_array"];

//Find airfield
_airfieldPos = [_array select 0,"airfield",[1000,99999]]call JOC_cmdMiscGetNearestStrategic;
if(count (_airfieldPos - [0,0,0]) == 0)exitWith{[]};

JOC_pauseCache = true;

//Spawn helicopters
_list = nearestObjects [_airfieldPos, ["LocationRespawnPoint_F"], 2000];
_posHeli = getPos (_list select 0);
_heli = [_posHeli,(airPool call BIS_fnc_selectRandom),0] call Zen_SpawnHelicopter;
_gunship = [_posHeli,(casPool call BIS_fnc_selectRandom),100] call Zen_SpawnHelicopter;
_groupGunship = (group ((crew _gunship) select 0));
_groupHeli = (group ((crew _heli) select 0));
_groupGunship setVariable["JOC_caching_disabled",true];
[_groupGunship]call JOC_setGroupID;
_groupHeli setVariable["JOC_caching_disabled",true];
[_groupHeli]call JOC_setGroupID;

//Spawn infantry
_groupInf = [[0,0,0], east, "infantry", getNumber(configFile >> "CfgVehicles" >> (typeOf _heli) >> "transportSoldier"),"Basic"]call Zen_SpawnInfantry;
_groupInf setVariable["JOC_caching_disabled",true];
[_groupInf]call JOC_setGroupID;
{
    _x moveInAny _heli;
}forEach (units _groupInf);

JOC_pauseCache = false;

_wp1 = _groupHeli addWaypoint [(_array select 0), (_array select 1) * 1.5];
_wp1 setWaypointType "TR UNLOAD";
_wp1 setWaypointCompletionRadius 400;

_wp2 = _groupGunship addWaypoint [(_array select 0), 0];
_wp2 setWaypointType "SAD";

_scriptArray1 = [
["crew (vehicle (leader (_this select 1))) < 4","_airfieldPos = [getPos ((_this select 1) select 0),""airfield"",[1000,99999]]call JOC_cmdMiscGetNearestStrategic; _wp1 = (_this select 1) addWaypoint [_airfieldPos, 0];_wp1 setWaypointType ""GETOUT"";"],
["(count (waypoints (_this select 1)) <= currentWaypoint (_this select 1))","(_this select 1) setVariable[""JOC_cleanUp"",true]"]
];

_scriptArray2 = [
["fuel (vehicle (leader (_this select 1))) < 0.1 || damage (vehicle (leader (_this select 1))) > 0.5 || (strategicArray select ((_this select ) select 5)) select 4 == 1","_airfieldPos = [getPos ((_this select 1) select 0),""airfield"",[1000,99999]]call JOC_cmdMiscGetNearestStrategic; _wp1 = (_this select 1) addWaypoint [_airfieldPos, 0];_wp1 setWaypointType ""GETOUT"";"],
["(count (waypoints (_this select 1)) <= currentWaypoint (_this select 1))","(_this select 1) setVariable[""JOC_cleanUp"",true]"]
];

_order = [[[1,3],_array,(_groupHeli getVariable ["groupID", -1]),_scriptArray1],[[1,0],_array,(_groupGunship getVariable ["groupID", -1]),_scriptArray2]];

_order
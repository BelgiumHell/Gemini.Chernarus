/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array","_category"];

_startPos = [(_array select 0),"base",[1200,5000]]call JOC_cmdMiscGetNearestStrategic;
if(count (_startPos - [0,0,0]) == 0)exitWith{[]};

_vehArr = [];
switch (_category) do {
    case (1): {
        _vehArr = [(selectRandom tankPool),(selectRandom tankPool),(selectRandom apcPool),(selectRandom ifvPool)];
    };
    case (2): {
        _vehArr = [(selectRandom tankPool),(selectRandom apcPool)];
    };
};

//Spawn convoy
_groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy setVariable["JOC_caching_disabled",true];
_wp1 = _groupConvoy addWaypoint [(_array select 0), 0];
_wp1 setWaypointType "MOVE";

_scriptArray = [
["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 200","(_this select 1) setVariable[""JOC_caching_disabled"", false, true];"]
];

_order = [[[1,0],_array,(_groupConvoy getVariable ["groupID", -1]),_scriptArray]];

_order

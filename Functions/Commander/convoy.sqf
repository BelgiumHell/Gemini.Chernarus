/////////////////////////
//Script made by Jochem//
/////////////////////////
_targetTown = 0;
_startTown = 0;
_ok = 0;
_count = 0;
_dis = 0;
hint "start";
while{_ok == 0}do{
    _targetTown = opTowns select (round (random (count opTowns)));

    {
        _dis = (getPos _targetTown) distance (getPos _x);
        if(_dis >= 4000)then{
            _startTown = _x;
            _ok = 1;
            if(true)exitWith{};
        };
    }forEach opTowns;

    _count = _count + 1;
    if(_count == (count opTowns))then{
        _dis = _dis - 50;
        _count = 0;
    };
};
_targetP = getPos _targetTown;
_startP = getPos _startTown;

hint "lol";

//Spawn convoy
_ifv = (ifvPool call BIS_fnc_selectRandom);
_trucks = [];
_truckC = (round (random 5));
_y = 0;
while{_y < _truckC}do{
    _trucks = _trucks + [(supportPool call BIS_fnc_selectRandom)];
    _y = _y + 1;
};
_apc = (apcPool call BIS_fnc_selectRandom);

_convoyA = [_ifv] + _trucks + [_apc];
testV = _convoyA;

_locationS = [_startP,[0,400],0,1,[1,400],0,[1,1,100]] call Zen_FindGroundPosition;
_convoyO = [_locationS,_convoyA]call Zen_SpawnConvoy;

_crew = [];
{
    _crew = _crew + (crew _x);
}forEach _convoyO;
_group = group (_convoyO select 0);

zeusMod addCuratorEditableObjects [_convoyO,false];
zeusMod addCuratorEditableObjects [_crew,false];

_group setFormation "COLUMN";
_group setBehaviour "SAFE";
_group move _targetP;
[_convoyO]spawn Zen_TrackVehicles;

_name = [5] call Zen_StringGenerateRandom;
_marker = createMarker [_name, _startP];//Marker
_name setMarkerType "mil_start";
_name setMarkerColor "ColorOPFOR";
_name setMarkerText "Convoy start";

_name2 = [5] call Zen_StringGenerateRandom;
_marker2 = createMarker [_name2, _targetP];//Marker
_name2 setMarkerType "mil_end";
_name2 setMarkerColor "ColorOPFOR";
_name2 setMarkerText "Convoy end";

[["IntelAdded",[format ["A convoy from %1 left for %2.", (text _startTown),(text _targetTown)]]],"BIS_fnc_showNotification",west] call BIS_fnc_MP; //Notification

waitUntil{sleep 5; (((leader _group)distance _targetP)< 100) or ([units _group]call Zen_AreNotInVehicle)};

if(((leader _group)distance _targetP)< 100)then{
    [["IntelAdded",[format ["The enemy convoy arrived at %1",(text _targetTown)]]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;

    _clean = true;
    while{_clean}do{
        _nearestPlayers = [];
        {
            if (isPlayer _x && _x distance _location < 1000) then {
                _nearestPlayers pushBack _x;
            };
        }forEach(playableUnits + switchableUnits);
        if(count _nearestPlayers == 0)then{
            _clean = false;
            {
                deleteVehicle (vehicle _x);
                deleteVehicle _x;
            }forEach (units _group);
        };
        sleep 10;
    };
}else{
    [["IntelAdded",["The enemy convoy has been destroyed"]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;
};
deleteMarker _marker;
deleteMarker _marker2;

/////////////////////////
//Script made by Jochem//
/////////////////////////
_ok = 0;

//Get location of town
_capitals = nearestLocations [getPosATL player, ["NameCityCapital"], 35000];
_capitalName = capitalName;
_towns = nearestLocations [getPosATL player, ["NameCity"], 35000];
_villages = nearestLocations [getPosATL player, ["NameVillage"], 35000];


_targetTown = 0;
_townName = 0;
while{_ok == 0}do{
    _targetTown = _villages select (floor (random (count _villages)));
    if((count _towns + count _capitals) > count opTownsN)then{_targetTown = _towns select ((count opTownsN) - count _capitals);};
    if((count _capitals) > count opTownsN)then{_targetTown = _capitals select (count opTownsN);};
    _townName = text _targetTown;
    if (!(_townName in opTownsN) && !(_townName in blackTowns))then{_ok = 1; [opTownsN,count opTownsN,_townName] call Zen_ArrayInsert; [opTowns,count opTowns,_targetTown] call Zen_ArrayInsert;};
    Sleep 1;
};

if(_targetTown in _towns)then{
    _location = position (_targetTown);
    _nameT = _townName;

    _trg = createTrigger ["EmptyDetector",_location,true];
    _trg setTriggerArea [900,900,900,false];
    _trg setTriggerActivation ["WEST","PRESENT", false];
    _trg setTriggerStatements ["this","[getPos thisTrigger,475,[11,true],[5,false],[0,false],[3,false],[1,false],[0,false,""cas""],[0,false]] call JOC_spawnZone;[getPos thisTrigger,600] spawn JOC_monitorTown;deleteVehicle thisTrigger;",""];
    _trg setTriggerTimeout [5,5,5,true];

    _marker = createMarker [_nameT, _location];
    _nameT setMarkerShape "ELLIPSE";
    _nameT setMarkerSize [550,550];
    _nameT setMarkerBrush "SolidBorder";
    _nameT setMarkerColor "ColorOPFOR";

    [opTownMarkers,count opTownMarkers,_nameT] call Zen_ArrayInsert;
};

if(_targetTown in _villages)then{
    _location = position (_targetTown);
    _nameT = _townName;

    _location = position (_targetTown);
    _trg = createTrigger ["EmptyDetector",_location,true];
    _trg setTriggerArea [700,700,700,false];
    _trg setTriggerActivation ["WEST","PRESENT", false];
    _trg setTriggerStatements ["this","[getPos thisTrigger,250,[7,true],[2,false],[0,false],[0,false],[0,false],[0,false,""cas""],[0,false]] call JOC_spawnZone;[getPos thisTrigger,400] spawn JOC_monitorTown; deleteVehicle thisTrigger;",""];
    _trg setTriggerTimeout [5,5,5,true];

    _marker = createMarker [_nameT, _location];
    _nameT setMarkerShape "ELLIPSE";
    _nameT setMarkerSize [300,300];
    _nameT setMarkerBrush "SolidBorder";
    _nameT setMarkerColor "ColorOPFOR";

    [opTownMarkers,count opTownMarkers,_nameT] call Zen_ArrayInsert;
};

if(_targetTown in _capitals)then{
    _location = position (_targetTown);
    _nameT = _townName;

    _location = position (_targetTown);
    _trg = createTrigger ["EmptyDetector",_location,true];
    _trg setTriggerArea [1200,1200,1200,false];
    _trg setTriggerActivation ["WEST","PRESENT", false];
    _trg setTriggerStatements ["this","[getPos thisTrigger,700,[15,true],[7,false],[0,false],[5,false],[2,false],[0,false,""cas""],[0,false]] call JOC_spawnZone;[getPos thisTrigger,800] spawn JOC_monitorTown;deleteVehicle thisTrigger;",""];
    _trg setTriggerTimeout [5,5,5,true];

    _marker = createMarker [_nameT, _location];
    _nameT setMarkerShape "ELLIPSE";
    _nameT setMarkerSize [700,700];
    _nameT setMarkerBrush "SolidBorder";
    _nameT setMarkerColor "ColorOPFOR";

    [opTownMarkers,count opTownMarkers,_nameT] call Zen_ArrayInsert;
};

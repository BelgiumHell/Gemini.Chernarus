/////////////////////////
//Script made by Jochem//
/////////////////////////
[[], {
    _inidbi = 0;
    _inidbiBack = 0;
    if (saveCount/2 == round(saveCount/2)) then {
        _inidbi = inidbiDB1;
        _inidbiBack = inidbiDB2;
    } else {
        _inidbi = inidbiDB2;
        _inidbiBack = inidbiDB1;
    };

    diag_log format ["Starting save at %1 since mission load", diag_tickTime];

    //Delete existing main database content
    ["deleteSection", "main"] call _inidbi;

    //Start writing
    //Indicate database is being written
    ["write", ["header", "saved", false]] call _inidbi;

    //StrategicArray
    {
        _array = [(_x select 0), (_x select 1), (_x select 2), [format ["%1", (_x select 3)], getMarkerPos (_x select 3), markerShape (_x select 3), getMarkerSize (_x select 3), markerBrush (_x select 3), getMarkerColor (_x select 3)], (_x select 4), (_x select 5)];
        _success = ["write", ["main", format ["strategicArray_%1", _forEachIndex], _array]] call _inidbi;

        if (!_success) then {
            diag_log format ["Failed to save %1 at %2 (strategicArray)", _array, diag_tickTime];
        };
    } forEach strategicArray;

    //Units
    {
        _array = [_x] call JOC_savePrepUnit;

        _success = ["write", ["main", format ["unitArray_%1", _forEachIndex], _array]] call _inidbi;

        if (!_success) then {
            diag_log format ["Failed to save %1 at %2 (unitArray)", _x, diag_tickTime];
        };
    } forEach unitArray;

    {
        _array = [_x] call JOC_savePrepVehicle;
        
        _success = ["write", ["main", format ["vehicleArray_%1", _forEachIndex], _array]] call _inidbi;

        if (!_success) then {
            diag_log format ["Failed to save %1 at %2 (vehicleArray)", _x, diag_tickTime];
        };
    } forEach vehicleArray;

    {
        _success = ["write", ["main", format ["orderArray_%1", _forEachIndex], _x]] call _inidbi;

        if (!_success) then {
            diag_log format ["Failed to save %1 at %2 (orderArray)", _x, diag_tickTime];
        };
    } forEach orderArray;

    {
        _success = ["write", ["main", format ["requestArray_%1", _forEachIndex], _x]] call _inidbi;

        if (!_success) then {
            diag_log format ["Failed to save %1 at %2 (requestArray)", _x, diag_tickTime];
        };
    } forEach requestArray;

    {
        _success = ["write", ["main", format ["assignedArray_%1", _forEachIndex], _x]] call _inidbi;

        if (!_success) then {
            diag_log format ["Failed to save %1 at %2 (assignedArray)", _x, diag_tickTime];
        };
    } forEach assignedArray;

    _fobArray = [];
    {
        if (locked _x == 2) then {
            _fobArray pushBack [getPosASL _x, getDir _x, true];
        } else {
            _fobArray pushBack [getPosASL _x, getDir _x, false];
        };
    } forEach fobTrucks;
    ["write", ["main", "fobArray", _fobArray]] call _inidbi;

    _damageValues = [];
    _count = 0;
    _arrayD = [];
    {
        _arrayD pushBack (damage _x);
        _count = _count + 1;

        if (_count == 500) then {
            _damageValues pushBack _arrayD;
            _arrayD = [];
            _count = 0;
        };
    } forEach objectsStart;
    _damageValues pushBack _arrayD;
    {
        ["write", ["main", format ["damageValues_%1", _forEachIndex], _x]] call _inidbi;
    } forEach _damageValues;

    {
        _success = ["write", ["header", format ["buildObjects_%1", _forEachIndex], [typeOf _x, getPosASL _x, getDir _x]]] call _inidbi;

        if (!_success) then {
            diag_log format ["Failed to save %1 at %2 (buildObjects)", _x, diag_tickTime];
        };
    } forEach buildObjects;

    ["write", ["main", "currentUnitID", currentUnitID]] call _inidbi;
    ["write", ["main", "currentVehicleID", currentVehicleID]] call _inidbi;
    ["write", ["main", "currentGroupID", currentGroupID]] call _inidbi;
    ["write", ["main", "currentRequestID", currentRequestID]] call _inidbi;
    ["write", ["main", "jetActive", jetActive]] call _inidbi;
    ["write", ["main", "jetReady", jetReady]] call _inidbi;

    ["write", ["header", "saved", true]] call _inidbi;
    ["write", ["header", "saved", false]] call _inidbiBack;

    saveCount = saveCount + 1;

    diag_log format ["Finished save at %1 since mission load", diag_tickTime];
}] remoteExec ["BIS_fnc_spawn", 2];

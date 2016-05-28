/////////////////////////
//Script made by Jochem//
/////////////////////////
[[],{
/*Notes: jetActive is not saved due to techical limitations, all special behaviour scripts are also interrupted. Need to find a way to handle support scripts like convoy/heli insertion (I disabled all AI features until I can save them)*/
    _inidbi = 0;
    _inidbiBack = 0;
    if(saveCount/2 == round(saveCount/2))then{
        _inidbi = inidbiDB1;
        _inidbiBack = inidbiDB2;
    }else{
        _inidbi = inidbiDB2;
        _inidbiBack = inidbiDB1;
    };

    [[],{
        hint "Mission is being saved, you may experience some desync and framedrops";
    }] remoteExec ["BIS_fnc_spawn", 0, true];

    //Delete existing main database content
    ["deleteSection", "main"] call _inidbi;

    //Start writing
    //Indicate database is being written
    ["write", ["header", "saved", false]] call _inidbi;

    //StrategicArray
    {
        _array = [(_x select 0),(_x select 1),(_x select 2),[format["%1",(_x select 3)], getMarkerPos (_x select 3), markerShape (_x select 3), getMarkerSize (_x select 3), markerBrush (_x select 3), getMarkerColor (_x select 3)],(_x select 4)];
        ["write", ["main",format["strategicArray_%1",_forEachIndex], _array]] call _inidbi;
    } forEach strategicArray;

    //Units
    _unitArray = [];
    {
        if(side _x != west)then{
            _unitArray pushBack ([units _x]call JOC_saveVirtualize);
        };
    } forEach allGroups;
    {
        ["write", ["main", format["virtualizedArray_%1",_forEachIndex], _x]] call _inidbi;
    } forEach (_unitArray + virtualizedArray);

    _fobArray = [];
    {
        if(locked _x == 2)then{
            _fobArray pushBack [getPosASL _x, getDir _x, true];
        }else{
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

        if(_count == 500)then{
            _damageValues pushBack _arrayD;
            _arrayD = [];
            _count = 0;
        };
    } forEach objectsStart;
    _damageValues pushBack _arrayD;
    {
        ["write", ["main", format["damageValues_%1",_forEachIndex], _x]] call _inidbi;
    } forEach _damageValues;

    ["write", ["header", "saved", true]] call _inidbi;
    ["write", ["header", "saved", false]] call _inidbiBack;

    saveCount = saveCount + 1;

    diag_log format["Saved mission at %1 since mission load", diag_tickTime];
    [[],{
        hint "Mission saved";
    }] remoteExec ["BIS_fnc_spawn", 0, true];
}] remoteExec ["BIS_fnc_spawn", 2];

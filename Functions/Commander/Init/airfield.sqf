/////////////////////////
//Script made by Jochem//
/////////////////////////

{
    _marker = _x;
    _location = getMarkerPos _marker;
    _size = getMarkerSize _marker;
    _dir = (markerDir _marker);

    //Spawn empty helicopter-jets
    _tentHangars = nearestObjects [_location,["Land_TentHangar_V1_F"],(_size select 0)];
    _hangars = nearestObjects [_location,["Land_Hangar_F"],(_size select 0)];

    {
        _spawnPos = [getPos _x,25,(getDir _x)] call Zen_ExtendPosition;
        _heli = [_spawnPos,((airPool + casPool) call BIS_fnc_selectRandom),1,(getDir _x)] call Zen_SpawnVehicle;
        _heli enableSimulationGlobal false;
        _heli allowDamage false;
        _heli enableSimulationGlobal true;
        _heli allowDamage true;
    } forEach _tentHangars;

    {
        _heli = [getPos _x,((jetPoolAA + jetPoolAG) call BIS_fnc_selectRandom),1,(getDir _x) + 180] call Zen_SpawnVehicle;
        _heli enableSimulationGlobal false;
        _heli allowDamage false;
        _heli enableSimulationGlobal true;
        _heli allowDamage true;
    } forEach _hangars;

    _priority = (_size select 0)*3;

    if(_priority < 500)then{
        _priority = 500;
    };

    strategicArray pushBack [_location,_priority,"airfield",_x,1];
} forEach airfieldMarkers;

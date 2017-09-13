/////////////////////////
//Script made by Jochem//
/////////////////////////
_usedCompounds = [];
dieselFactories = nearestObjects [(getMarkerPos "mrk_area"),["Land_dp_mainFactory_F","Land_spp_Tower_F"],worldSize*2.0^0.5];
mainFactories = nearestObjects [(getMarkerPos "mrk_area"),["Land_Factory_Main_F"],worldSize*2.0^0.5];

{
    if (!(_x in _usedCompounds)) then {

        _nameM = format ["mrk_strategic_factory_%1",_forEachIndex];
        _marker = createMarker [_nameM,(getPos _x)];
        _nameM setMarkerShape "RECTANGLE";
        _nameM setMarkerSize [200,200];
        _nameM setMarkerBrush "SolidBorder";
        _nameM setMarkerColor "ColorOpfor";

        _compounds = nearestObjects [(getPos _x),["Land_Factory_Main_F"],200];
        _usedCompounds append _compounds;

        strategicArray pushBack [(getPos _x),800,"factory",_nameM,1];
    };
} forEach mainFactories;

{
    if (!(_x in _usedCompounds)) then {

        _nameM = format ["mrk_strategic_powerplant_%1",_forEachIndex];
        _marker = createMarker [_nameM,(getPos _x)];
        _nameM setMarkerShape "RECTANGLE";
        _nameM setMarkerSize [120,120];
        _nameM setMarkerBrush "SolidBorder";
        _nameM setMarkerColor "ColorOpfor";

        _compounds = nearestObjects [(getPos _x),["Land_dp_mainFactory_F"],200];
        _usedCompounds append _compounds;

        strategicArray pushBack [(getPos _x),600,"factory",_nameM,1,2];
    };
} forEach dieselFactories;

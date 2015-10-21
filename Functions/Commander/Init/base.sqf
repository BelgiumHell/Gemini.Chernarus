/////////////////////////
//Script made by Jochem//
/////////////////////////
_usedCompounds = [];

hint "lol";

_towersB = nearestObjects [(getMarkerPos "mrk_area"),["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F"],worldSize*2.0^0.5];
_towersS = nearestObjects [(getMarkerPos "mrk_area"),["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F"],worldSize*2.0^0.5];
_compoundsB = nearestObjects [(getMarkerPos "mrk_area"),["Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F"],worldSize*2.0^0.5];
_compoundsS = nearestObjects [(getMarkerPos "mrk_area"),["Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],worldSize*2.0^0.5];

{
    if(!(_x in _usedCompounds))then{
        _compounds = nearestObjects [(getPos _x),["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],300];
        _priority = (count _compounds)*50;

        _nameM = format["mrk_strategic_base_%1",_forEachIndex];
        _marker = createMarker [_nameM, (getPos _x)];
        _nameM setMarkerShape "ELLIPSE";
        _nameM setMarkerSize [300,300];
        _nameM setMarkerBrush "SolidBorder";
        _nameM setMarkerColor "ColorIndependent";

        _usedCompounds append _compounds;

        strategicArray pushBack [(getPos _x),_priority,"base",_nameM,east];
    };
} forEach (_compoundsB + _towersB);

{
    if(!(_x in _usedCompounds))then{
        _compounds = nearestObjects [(getPos _x),["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],300];
        _priority = (count _compounds)*50;

        _nameM = format["mrk_strategic_base_small_%1",_forEachIndex];
        _marker = createMarker [_nameM, (getPos _x)];
        _nameM setMarkerShape "ELLIPSE";
        _nameM setMarkerSize [50,50];
        _nameM setMarkerBrush "SolidBorder";
        _nameM setMarkerColor "ColorIndependent";

        _usedCompounds append _compounds;

        strategicArray pushBack [(getPos _x),_priority,"base",_nameM,east];
    };
} forEach ((_towersS + _compoundsS) - _usedCompounds);

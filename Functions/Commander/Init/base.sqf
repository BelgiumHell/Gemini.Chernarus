/////////////////////////
//Script made by Jochem//
/////////////////////////
_usedCompounds = [];

_towersB = nearestObjects [(getMarkerPos "mrk_area"),["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F"],worldSize*2.0^0.5];
_towersS = nearestObjects [(getMarkerPos "mrk_area"),["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F"],worldSize*2.0^0.5];
_compoundsB = nearestObjects [(getMarkerPos "mrk_area"),["Land_Dome_Big_F","Land_Dome_Small_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F"],worldSize*2.0^0.5];
_compoundsS = nearestObjects [(getMarkerPos "mrk_area"),["Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_HBarrierTower_F"],worldSize*2.0^0.5];

{
    if(!(_x in _usedCompounds) && !([_x,"mrk_safeZone"]call Zen_AreInArea))then{
        _compounds = nearestObjects [(getPos _x),["Land_Dome_Big_F","Land_Dome_Small_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],350];
        _priority = (count _compounds)*50;

        _positions = [];
        {
            _positions pushBack (getPos _x);
        } forEach _compounds;

        _pos = [_positions]call JOC_findCenter;

        _nameM = format["mrk_strategic_base_%1",_forEachIndex];
        _marker = createMarker [_nameM, _pos];
        _nameM setMarkerShape "ELLIPSE";
        _nameM setMarkerSize [200,200];
        _nameM setMarkerBrush "SolidBorder";
        _nameM setMarkerColor "ColorOpfor";

        _usedCompounds append _compounds;

        strategicArray pushBack [_pos,_priority,"base",_nameM,1];
    };
} forEach (_compoundsB + _towersB);

{
    if(!(_x in _usedCompounds) && !([_x,"mrk_safeZone"]call Zen_AreInArea))then{
        _compounds = nearestObjects [(getPos _x),["Land_Dome_Big_F","Land_Dome_Small_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"],100];
        _priority = (count _compounds)*50;

        _nameM = format["mrk_strategic_outpost_%1",_forEachIndex];
        _marker = createMarker [_nameM, (getPos _x)];
        _nameM setMarkerShape "ELLIPSE";
        _nameM setMarkerSize [50,50];
        _nameM setMarkerBrush "SolidBorder";
        _nameM setMarkerColor "ColorOpfor";

        _usedCompounds append _compounds;

        strategicArray pushBack [(getPos _x),_priority,"outpost",_nameM,1];
    };
} forEach ((_towersS + _compoundsS) - _usedCompounds);

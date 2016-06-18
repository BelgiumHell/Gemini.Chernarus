/////////////////////////
//Script made by Jochem//
/////////////////////////
radioTowers = nearestObjects [getMarkerPos "mrk_area",["Land_TTowerBig_1_F","Land_TTowerBig_2_F"],worldSize*2.0^0.5];

{
    _tower = _x;
    _location = getPosWorld _tower;

    _nameM = format["mrk_strategic_radio_%1",_forEachIndex];
    _marker = createMarker [_nameM, _location];
    _nameM setMarkerShape "ELLIPSE";
    _nameM setMarkerSize [200,200];
    _nameM setMarkerBrush "SolidBorder";
    _nameM setMarkerColor "ColorOpfor";

    strategicArray pushBack [_location,500,"radio",_nameM,1];
} forEach radioTowers;

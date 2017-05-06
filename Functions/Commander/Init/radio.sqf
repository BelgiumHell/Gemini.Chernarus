/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    _tower = _x;
    _location = getPosWorld _tower;

    _nameM = format["mrk_strategic_radio_%1",_forEachIndex];
    _marker = createMarker [_nameM,_location];
    _nameM setMarkerShape "ELLIPSE";
    _nameM setMarkerSize [200,200];
    _nameM setMarkerBrush "SolidBorder";
    _nameM setMarkerColor "ColorOpfor";

    strategicArray pushBack [_location,500,"radio",_nameM,1,2];
} forEach radiotowers;

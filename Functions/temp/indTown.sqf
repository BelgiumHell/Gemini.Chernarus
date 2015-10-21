/////////////////////////
//Script made by Jochem//
/////////////////////////
_villages  = nearestLocations [(getMarkerPos "mrk_area"), ["NameVillage"], worldSize*2.0^0.5];

_x = 0;
while{_x < count _villages}do{
    _village  = _villages select _x;
    _name     = text _village;
    _location = position (_village);

    if(!(_name in blackTowns) && !(_name in (opMarkers select 0)))then{

        _marker = createMarker [_name, _location];
        _name setMarkerShape "ELLIPSE";
        _name setMarkerSize [300,300];
        _name setMarkerBrush "SolidBorder";
        _name setMarkerColor "ColorCIV";

        [_location,300] spawn JOC_monitorMarker;
        strategicArray pushBack [_location,300,"town",_name,civilian];
    };

    _x = _x + 1;
    Sleep 0.01;
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
//Get location of town
_capitals = nearestLocations [(getMarkerPos "mrk_area"), ["NameCityCapital"], worldSize*2.0^0.5];
_towns = nearestLocations [(getMarkerPos "mrk_area"), ["NameCity"], worldSize*2.0^0.5];
_villages = nearestLocations [(getMarkerPos "mrk_area"), ["NameVillage"], worldSize*2.0^0.5];

_name = "";
_location = 0;
_nameM = "";
{
    _name = (text _x);
    _location = (getPos _x);
    _nameM = format["mrk_strategic_town_%1",_name];
    if(!(_name in blackTowns))then{
        if(_x in _villages)then{
            _marker = createMarker [_nameM, _location];
            _nameM setMarkerShape "ELLIPSE";
            _nameM setMarkerSize [200,200];
            _nameM setMarkerBrush "SolidBorder";
            _nameM setMarkerColor "ColorOpfor";

            strategicArray pushBack [_location,300,"town",_nameM,east];
        };

        if(_x in _towns)then{
            _marker = createMarker [_nameM, _location];
            _nameM setMarkerShape "ELLIPSE";
            _nameM setMarkerSize [550,550];
            _nameM setMarkerBrush "SolidBorder";
            _nameM setMarkerColor "ColorOpfor";

            strategicArray pushBack [_location,500,"town",_nameM,east];
        };

        if(_x in _capitals)then{
            _marker = createMarker [_nameM, _location];
            _nameM setMarkerShape "ELLIPSE";
            _nameM setMarkerSize [700,700];
            _nameM setMarkerBrush "SolidBorder";
            _nameM setMarkerColor "ColorOpfor";

            strategicArray pushBack [_location,900,"town",_nameM,east];
        };
    };
} forEach (_capitals + _towns + _villages);

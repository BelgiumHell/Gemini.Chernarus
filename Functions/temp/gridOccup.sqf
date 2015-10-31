/////////////////////////
//Script made by Jochem//
/////////////////////////
_gridMarkers = [];
_prevLand = false;

//Init grids
_startloc = [500,500,0];
_hor = worldSize / 1000;
_vert = worldSize / 1000;

_xA = 0;
_yA = 0;
_location = _startloc;
while {_xA < _hor}do{
	while {_yA < _vert}do{
        if(!(surfaceIsWater _location))then{
            _name = [15] call Zen_StringGenerateRandom;
            _marker = createMarker[_name,_location];
            _name setMarkerShape "RECTANGLE";
            _name setMarkerSize [500,500];
            _name setMarkerBrush "SolidBorder";
            _name setMarkerColor "ColorCIV";
            _gridMarkers pushBack _name;

            _prevLand = true;
            [_name, "grid"]spawn JOC_monitorMarker;
        }else{
            if(_prevLand)then{
                _name = [15] call Zen_StringGenerateRandom;
                _marker = createMarker[_name,_location];
                _name setMarkerShape "RECTANGLE";
                _name setMarkerSize [500,500];
                _name setMarkerBrush "SolidBorder";
                _name setMarkerColor "ColorCIV";
                _gridMarkers pushBack _name;

                [_name, "grid"]spawn JOC_monitorMarker;
            };
            _prevLand = false;
        };

		_yA = _yA + 1;
		_location = [_location,1000,0] call Zen_ExtendPosition;
	};
	_yA = 0;
	_xA = _xA + 1;
	_location = [_startLoc,(_xA * 1000),90] call Zen_ExtendPosition;
};

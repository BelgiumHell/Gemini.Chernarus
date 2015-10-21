/////////////////////////
//Script made by Jochem//
/////////////////////////
_marker = _this select 0;
_type = _this select 1;

_markerI = 0;
if(_type == "base")then{
    _markerI = _marker;
    _location = getMarkerPos _markerI;

    _marker = [4] call Zen_StringGenerateRandom;
    _mrk = createMarker [_marker,_location];
    _marker setMarkerSize [300,300];
    _marker setMarkerShape "RECTANGLE";
    _marker setMarkerAlpha 0;
};

_owner = 2;	//0 = BLUFOR|1 = OPFOR

//Create object triggers
_location = getMarkerPos _marker;
_size = getMarkerSize _marker;
_dir = markerDir _marker;

_trgO = createTrigger ["EmptyDetector",_location,true];
_trgO setTriggerArea [(_size select 0),(_size select 1),1200,false];
_trgO setTriggerActivation ["EAST","PRESENT", false];
_trgO setTriggerStatements ["this","",""];
_trgO setTriggerTimeout [5,5,5,true];
_trgO setDir _dir;

_trgB = createTrigger ["EmptyDetector",_location,true];
_trgB setTriggerArea [(_size select 0),(_size select 1),1200,false];
_trgB setTriggerActivation ["WEST","PRESENT", false];
_trgB setTriggerStatements ["this","",""];
_trgB setTriggerTimeout [5,5,5,true];
_trgB setDir _dir;

sleep 5;

while{true}do{

    //Set blufor owner
	if(((count list _trgB >= 4) and (count list _trgO <= 5)) and _owner != 0)then{
		_marker setMarkerColor "ColorBLUFOR";

        if(_type == "town")then{
            (bluMarkers select 0) pushBack _marker;
            (opMarkers select 0) = (opMarkers select 0) - [_marker];
        };

        if(_type == "base")then{
            _markerI setMarkerColor "ColorBLUFOR";
            (bluMarkers select 1) pushBack _markerI;
            (opMarkers select 1) = (opMarkers select 1) - [_markerI];
        };

        if(_type == "airfield")then{
            (bluMarkers select 2) pushBack _marker;
            (opMarkers select 2) = (opMarkers select 2) - [_marker];
        };

        if(_type == "grid")then{
            (bluMarkers select 3) pushBack _marker;
            (opMarkers select 3) = (opMarkers select 3) - [_marker];
        };

		_owner = 0;
	};

    //Set opfor owner
	if(((count list _trgB <= 3) and (count list _trgO >= 5)) and _owner != 1)then{
		_marker setMarkerColor "ColorOPFOR";

        if(_type == "town")then{
		    (opMarkers select 0) pushBack _marker;
		    (bluMarkers select 0) = (bluMarkers select 0) - [_marker];
        };

        if(_type == "base")then{
            _markerI setMarkerColor "ColorOPFOR";
            (opMarkers select 1) pushBack _markerI;
            (bluMarkers select 1) = (bluMarkers select 1) - [_markerI];
        };

        if(_type == "airfield")then{
            (opMarkers select 2) pushBack _marker;
            (bluMarkers select 2) = (bluMarkers select 2) - [_marker];
        };

        if(_type == "grid")then{
            (opMarkers select 3) pushBack _marker;
            (bluMarkers select 3) = (bluMarkers select 3) - [_marker];
        };

		_owner = 1;
	};

	sleep 10;
    publicVariable "bluMarkers";
    publicVariable "opMarkers";
};

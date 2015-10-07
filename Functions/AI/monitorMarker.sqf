/////////////////////////
//Script made by Jochem//
/////////////////////////
_marker = _this select 0;
_type = _this select 1;

_town = 0;
if(_type == "town")then{
    _town = (nearestLocations [_marker, ["NameCityCapital","NameCity","NameVillage"], 100]) select 0;
    _marker = text _town;
};

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

_owner = 1;	//0 = BLUFOR|1 = OPFOR

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
	if(((count list _trgB >= 4) and (count list _trgO <= 5)) and _owner == 1)then{
		_marker setMarkerColor "ColorBLUFOR";

        if(_type == "town")then{
            hint "lol";
            [bluTownsN,count bluTownsN,_marker] call Zen_ArrayInsert;
            [bluTowns,count bluTowns,_town] call Zen_ArrayInsert;
    		opTowns = opTowns - [_town];
    		opTownsN = opTownsN - [_marker];
        };

        if(_type == "airfield")then{
            _stringId = [_marker,"mrk_airfield_",""]call Zen_StringFindReplace;
            _id = parseNumber _stringId;
            airfieldOccup set [_id,true];
        };

        if(_type == "base")then{
            _markerI setMarkerColor "ColorBLUFOR";
            [baseMarkersB,count baseMarkersB,_markerI] call Zen_ArrayInsert;
            baseMarkersO = baseMarkersO - [_markerI];
        };

		_owner = 0;
	};

	if(((count list _trgB <= 3) and (count list _trgO >= 5)) and _owner == 0)then{
		_marker setMarkerColor "ColorOPFOR";

        if(_type == "town")then{
		    [opTownsN,count opTownsN,_marker] call Zen_ArrayInsert;
            [opTowns,count opTowns,_town] call Zen_ArrayInsert;
		    bluTowns = bluTowns - [_town];
		    bluTownsN = bluTownsN - [_marker];
        };

        if(_type == "airfield")then{
            _stringId = [_marker,"mrk_airfield_",""]call Zen_StringFindReplace;
            _id = parseNumber _stringId;
            airfieldOccup set [_id,false];
        };

        if(_type == "base")then{
            _markerI setMarkerColor "ColorOPFOR";
            [baseMarkersO,count baseMarkersO,_markerI] call Zen_ArrayInsert;
            baseMarkersB = baseMarkersB - [_markerI];
        };

		_owner = 1;
	};

	sleep 10;
	publicVariable "opTowns";
    publicVariable "airfieldOccup";
    publicVariable "baseMarkersO";
    publicVariable "baseMarkersB";
};

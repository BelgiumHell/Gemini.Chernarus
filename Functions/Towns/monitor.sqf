/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_location","size"];
_location = _this select 0;
_size = _this select 1;

_town = (nearestLocations [_location, ["NameCityCapital","NameCity","NameVillage"], 100]) select 0;
_nameT = text _town;

_owner = 1;	//0 = BLUFOR|1 = OPFOR

sleep 10;

//Side triggers
_trgO = createTrigger ["EmptyDetector",_location];
_trgO setTriggerArea [_size,_size,_size,false];
_trgO setTriggerActivation ["EAST","PRESENT", false];
_trgO setTriggerStatements ["this","",""];

_trgB = createTrigger ["EmptyDetector",_location];
_trgB setTriggerArea [_size,_size,_size,false];
_trgB setTriggerActivation ["WEST","PRESENT", false];
_trgB setTriggerStatements ["this","",""];

Sleep 10;

while{true}do{
	if((count list _trgO <= 5) and _owner == 1)then{
		_nameT setMarkerColor "ColorBLUFOR";
		[bluTownsN,count bluTownsN,_nameT] call Zen_ArrayInsert; [bluTowns,count bluTowns,_town] call Zen_ArrayInsert;
		opTowns = opTowns - [_town];
		opTownsN = opTownsN - [_nameT];
		_owner = 0;
	};
	if(((count list _trgB <= 3) and (count list _trgO >= 5)) and _owner == 0)then{
		_nameT setMarkerColor "ColorOPFOR";
		[opTownsN,count opTownsN,_nameT] call Zen_ArrayInsert; [opTowns,count opTowns,_town] call Zen_ArrayInsert;
		bluTowns = bluTowns - [_town];
		bluTownsN = bluTownsN - [_nameT];
		_owner = 1;
	};

	Sleep 10;
	publicVariable "opTowns";
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
_marker = _this select 0;
_id = _this select 1;
_location = getMarkerPos _marker;
_size = getMarkerSize _marker;
_dir = (markerDir _marker);

//Create activation trigger
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [(_size select 0)*3.5,(_size select 1)*3.5,1200,false];
_trg setTriggerActivation ["WEST","PRESENT", false];
_trg setTriggerStatements ["this","[getPos thisTrigger,([(triggerArea thisTrigger select 0)*0.4,(triggerArea thisTrigger select 1)*0.4,getDir thisTrigger]),[11,true],[4,false],[0,false],[3,false],[2,false],[0,false,""cas""],[0,false]] call JOC_spawnZone;deleteVehicle thisTrigger;",""];
_trg setTriggerTimeout [5,5,5,true];
_trg setDir (markerDir _marker);

//Spawn AA-defences
_ok = 0;
_count = 0;
while{_ok == 0}do{
	_marker = format["mrk_airfield_%1_aa_%2",_id,_count];
	markerT = _marker;
	if(getMarkerColor _marker == "")then{
		_ok = 1;
	}else{
		_aa = [getMarkerPos _marker,"O_APC_Tracked_02_AA_F",0,(markerDir _marker)] call Zen_SpawnVehicle;
		[_aa,east] call Zen_SpawnVehicleCrew;
		_aa setFuel 0;
		sleep 2;
		[_aa] joinSilent airfieldGroup;
		(crew _aa) joinSilent airfieldGroup;
		zeusMod addCuratorEditableObjects [[_aa],false];
		zeusMod addCuratorEditableObjects [(crew _aa),false];
	};
	_count = _count + 1;
};

//Spawn empty helicopter-jets
_ok = 0;
_count = 0;
while{_ok == 0}do{
	_marker = format["mrk_airfield_%1_hangar_%2",_id,_count];
	markerT = _marker;
	if(getMarkerColor _marker == "")then{
		_ok = 1;
	}else{
		_heli = [getMarkerPos _marker,((airPool + casPool) call BIS_fnc_selectRandom),1,(markerDir _marker)] call Zen_SpawnVehicle;
		_heli enableSimulationGlobal false;
		_heli allowDamage false;
		sleep 2;
		_heli enableSimulationGlobal true;
		_heli allowDamage true;
		zeusMod addCuratorEditableObjects [[_heli],false];
	};
	_count = _count + 1;
};

//Create object triggers
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

waitUntil{sleep 30;(count (list _trgO)) >= 1};

while{(count (list _trgO)) >= 5}do{
	if((count (list _trgB)) >= 5)then{
		[airfieldOccup,_id,cont] call Zen_ArrayInsert;
		sleep 30;
	};
};

deleteMarker _trgO;

[airfieldOccup,_id,true] call Zen_ArrayInsert;

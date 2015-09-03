/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_radar","_task","_list"];
_radar = _this select 0;
_location = getPosASL _radar;
_locationO = getPos _radar;

sleep 1;

_trg = createTrigger ["EmptyDetector",_location];
_trg setTriggerArea [6000,6000,6000,false];
_trg setTriggerActivation ["WEST","PRESENT", true];
_trg setTriggerStatements ["this","",""];

trgT = _trg;

sleep 10;

while{(count (_locationO nearObjects ["rhs_p37",50]) >= 1)}do{
	_list = list _trg;
	 
	_task = false;
	_targets = [];

	{
		if((typeOf _x) in radarTArray)then{
			if(!(terrainIntersectASL [getPosASL _x, _location]))then{
				_task = true; [_targets,count _targets,_x] call Zen_ArrayInsert;
			};
		};
	}forEach _list;

	if(_task)then{
		[_targets] spawn JOC_taskJet;
	};
	
	sleep 5;
};

deleteVehicle _trg;
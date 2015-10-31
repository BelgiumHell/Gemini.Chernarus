/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_marker","_id"];

_array = (strategicArray select _id);
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
        _array set [4, west];

		_owner = 0;
	};

    //Set opfor owner
	if(((count list _trgB <= 3) and (count list _trgO >= 5)) and _owner != 1)then{
        _array set [4, east];

		_owner = 1;
	};

    //Call for support
    if((count list _trgB) > (count list _trgO) * 0.5)then{
        //[_array,(list _trgO),(list _trgB)]call JOC_cmdCmdreqSupport;
    };

	sleep 10;
};

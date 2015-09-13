/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_location"];
_location = _this select 0;

_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [2000,2000,2000,false];
_trg setTriggerActivation ["EAST","PRESENT", false];

sleep 5;
_list = (list _trg);
hint "cch";
listT = _list;

{
	if(isNil{_x getVariable "JOC_disable_caching"})then{
		_x setVariable ["JOC_disable_caching",false,true];
		_name = [10] call Zen_StringGenerateRandom;
		_x setVehicleVarName _name;
	};
	if(!(_x getVariable "JOC_disable_caching"))then{
		if(_x == (leader(group _x)) and (group _x) != cacheGroup)then{
			_units =  (units(group _x));
			_x setVariable ["leader",true,true];
			_x setVariable ["units",_units,true];
			{
				_x enableSimulationGlobal false; _x hideObjectGlobal true;
				[_x] joinSilent cacheGroup;
			}forEach _units;
		};
	};
}forEach _list;

deleteVehicle _trg;

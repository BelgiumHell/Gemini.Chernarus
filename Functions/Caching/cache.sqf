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
listT = _list;

{
	if(isNil{_x getVariable "JOC_disable_caching"} and (_x isKindOf "man"))then{
		_x setVariable ["JOC_disable_caching",false,true];
		_name = [10] call Zen_StringGenerateRandom;
		_x setVehicleVarName _name;
	};
	if(isNil{_x getVariable "JOC_disable_caching"} and !(_x isKindOf "man"))then{
		_name = [10] call Zen_StringGenerateRandom;
		_x setVehicleVarName _name;
		{
			_x setVariable ["JOC_disable_caching",false,true];
			_name = [10] call Zen_StringGenerateRandom;
			_x setVehicleVarName _name;
		}forEach (crew _x);
	};
}forEach _list;

{
	if(!(_x getVariable "JOC_disable_caching"))then{
		if(_x == (leader(group _x)) and (group _x) != cacheGroup)then{
			_units =  (units(group _x));
			_x setVariable ["leader",true,true];
			_x setVariable ["units",_units,true];
			{
				_x enableSimulationGlobal false;
				_x hideObjectGlobal true;
				[_x] joinSilent cacheGroup;
			}forEach _units;
		};
		if(!(_x isKindOf "man"))then{
			{
				if(!(_x getVariable "JOC_disable_caching"))then{
					_x enableSimulationGlobal false;
					_x hideObjectGlobal true;
					_x setVariable ["vehicle",vehicle _x];
					[_x] joinSilent cacheGroup;
				};
			}forEach (crew _x);
		};
	};
}forEach _list;

deleteVehicle _trg;

////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_groups"];
_groups = _this select 0;

{
	_leader = (leader _x);
	if(isNil{_leader getVariable "JOC_disable_caching"})then{
		_leader setVariable ["JOC_disable_caching",false,true];
	};
	if(!(_leader getVariable "JOC_disable_caching"))then{
		_units =  (units(group _leader));
		{
			_name = [10] call Zen_StringGenerateRandom;
			_leader setVehicleVarName _name;
			_leader enableSimulationGlobal false; _leader hideObjectGlobal true;
			[_leader] joinSilent cacheGroup;
		}forEach _units;
		_leader setVariable ["leader",true,true];
		_leader setVariable ["units",_units,true];
	};
}forEach _groups;
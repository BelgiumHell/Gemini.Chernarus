/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_location","_group"];
_location = _this select 0;

_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [2000,2000,2000,false];
_trg setTriggerActivation ["EAST","PRESENT", false];

sleep 5;
_list = (list _trg);

{
	if(_x getVariable "leader")then{
		_group = createGroup east;
		[_x] joinSilent _group;
		_group selectLeader _x;
		_units = (_x getVariable "units") - [_x];
		_units joinSilent _group;
		if(!(isNil{_x getVariable "patrol"}))then{
			if((vehicle _x) != _x)then{
				_arg = ([_x] + (_x getVariable "patrol"));
				_arg spawn Zen_OrderVehiclePatrol;
			}else{
				_arg = ([group _x] + (_x getVariable "patrol"));
				_arg spawn Zen_OrderInfantryPatrol;
			};
		};
	};
	if(!(_x isKindOf "man"))then{
		{
			if(!(_x getVariable "JOC_disable_caching"))then{
				_x enableSimulationGlobal true;
				_x hideObjectGlobal false;
			};
		}forEach (crew _x);
	};
	_x enableSimulationGlobal true; _x hideObjectGlobal false;
}forEach _list;

deleteVehicle _trg;

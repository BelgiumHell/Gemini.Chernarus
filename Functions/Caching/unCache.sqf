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
		_units = (_x getVariable "units");
		_units joinSilent _group;
		if(!(isNil{_x getVariable "patrol"}))then{
			if((vehicle _x) != _x)then{
				([_x] + (_x getVariable "patrol"))spawn Zen_OrderVehiclePatrol;
			}else{
				([_group] + (_x getVariable "patrol")) spawn Zen_OrderInfantryPatrol;
			};
		};
	};
	_x enableSimulationGlobal true; _x hideObjectGlobal false;
}forEach _list;

deleteVehicle _trg;
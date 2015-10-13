/////////////////////////
//Script made by Jochem//
/////////////////////////
_heli = _this select 0;
_infG = _this select 1;

while{alive _heli}do{
	_targets = nearestObjects [_heli, ["SoldierWB"],1000];
	{
		_unit = _x;
		if((_heli knowsAbout _unit) == 0)then{
			_targets = [_targets,[_unit]]call Zen_ArrayFilterValues;
		};
	}forEach _targets;
	if((count _targets) >= 10)then{
		_locationI = [(getPos (_targets select 0)),[0,400],0,1] call Zen_FindGroundPosition;
		[_heli,_locationI,_infG,"full",10,"fastrope",false] spawn Zen_OrderInsertion;
		_infG move (getPos (_targets select 0));
		[_infG,(getPos (_targets select 0))] call BIS_fnc_taskAttack;
		waitUntil{sleep 3;isNull ((leader _infG) findNearestEnemy (leader _infG)) or (!alive (leader _infG))};
	 	if((!alive (leader _infG)) or (!alive _heli))then{
		}else{
		 	_pos = [(getPos (leader _infG)),0,0,1,0,0,0,0,0,[1,10,50],[1,0,60]] call Zen_FindGroundPosition;
		 	_handle = [_heli,_pos,_infG]spawn Zen_OrderExtraction;
			waitUntil{sleep 6;scriptDone _handle;};
			[_heli1,"mrk_area",[],[0,360],"full"]spawn Zen_OrderVehiclePatrol;
		};
	};
	sleep 10;
};

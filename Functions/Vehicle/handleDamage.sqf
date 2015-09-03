/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_fireEffect"];
_tank = _this select 0;
_part = _this select 1;
_damage = _this select 2;

_text = format["%1,%2",_part,_damage,(_tank getHit _part)];
hint _text;

_tank setHit[_part,((_damage * tankMuliplier) + (_tank getHit _part))];

if((_tank getHitPointDamage "HitEngine") > 0.8)then{
	if(!(_tank getVariable "burning"))then{
		_tank setVariable["burning",true,true];
		_fireEffect  = "test_EmptyObjectForFireBig" createVehicle position _tank;
		if((typeOf _tank) == "B_MBT_01_cannon_F")then{
			_fireEffect  attachTo[_tank,[0,1.5,-0.7]];
		}else{
			_fireEffect  attachTo[_tank,[0,-4,0]];
		};
		[_tank]spawn{
			_tank = _this select 0;
			while{alive _tank}do{
				if(_tank getVariable "burning")then{
					_tank setDamage ((damage _tank) + 0.05);
					sleep 0.5;
				};
			};
		};
		[_tank]spawn{
			_tank = _this select 0;
			_crew = [];
			while{alive _tank}do{
				if(_tank getVariable "burning")then{
					_crew = (crew _tank);
					{
						[]spawn{
							[] call BIS_fnc_flamesEffect;
							player setDamage ((damage player) + 0.05);
						};
					}forEach _crew;
					sleep 0.4;
				};
			};
		};
	};
};

if(!alive _tank)then{
	{
		_obj = _x;
		detach _obj;
		_obj setPos [999999,999999,999999];
	}forEach (attachedObjects _tank);
};
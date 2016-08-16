/////////////////////////
//Script made by Jochem//
/////////////////////////
switch (_this select 1) do
{
	//Open CDU or play music
	case 210:
	{
		if((vehicle player)isKindOf "Tank")then{
			[]spawn JOC_vehCDU;
		};
		if((vehicle player)isKindOf "air" && player == (driver(vehicle player)))then{
			if(musicPlay)then{
				musicPlay = false;
			}else{
				musicPlay = true;
			};
		};
	};

	//LEFT
	case 203:
	{
		_object = player getVariable ["buildObject",objNull];
        _object setDir ((getDir _object) - 10);
	};
	//RIGHT
	case 205:
	{
		_object = player getVariable ["buildObject",objNull];
        _object setDir ((getDir _object) + 10);
	};

	//Ignore all others
	default{};
};

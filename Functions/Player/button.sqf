/////////////////////////
//Script made by Jochem//
/////////////////////////
switch (_this select 1) do
{
	//Open CDU
	case 210:
	{
		if((vehicle player)isKindOf "Tank")then{
			[]spawn JOC_vehCDU;
		};
		if((vehicle player)isKindOf "Helicopter" && player == (driver(vehicle player)))then{
			if(musicPlay)then{
				musicPlay = false;
			}else{
				musicPlay = true;
			};
		};
	};

	//UP -> increase height
	case 200:
	{
		_object = player getVariable "buildObject";
		detach _object;
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") + 0.125)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") + 0.125)];
	};
	//DOWN -> decrease height
	case 208:
	{
		_object = player getVariable "buildObject";
		detach _object;
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") - 0.125)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") - 0.125)];
	};

	//Ignore all others
	default{};
};

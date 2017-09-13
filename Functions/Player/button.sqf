/////////////////////////
//Script made by Jochem//
/////////////////////////
switch (_this select 1) do
{
	//Open CDU or play music
	case 210:
	{
		if ((vehicle player)isKindOf "Tank") then {
			[] spawn JOC_vehCDU;
		};
		if ((vehicle player)isKindOf "Air" && player == (driver(vehicle player))) then {
			if (musicPlay) then {
				musicPlay = false;
			}else{
				musicPlay = true;
			};
		};
	};

	//Ignore all others
	default{};
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
switch (_this select 1) do
{
	case 210: 
	{
		hint "insert";
		[]spawn JOC_vehCDU;
	};
	//Ignore all others
	default{};
};
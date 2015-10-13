groupsT = _this select 0;
veh = _this select 1;
x = 0;
y = 0;
groupCount = (count groupsT);
vehCount = (count veh);

//Groups
while{groupCount > x}do{
	groupT = groupsT select x;
	unitCount = (count units groupT);
	while{unitCount > y}do{
		unit = units groupT select 0;
		deleteVehicle unit;
		Sleep 3;
		y = y + 1;
	};
	waitUntil{count units groupT == 0};
	Sleep 3;
	x = x + 1;
	y = 0;
};


x = 0;
y = 0;

hint "veh";

//Vehicles
while{vehCount > x}do{
	_veh = veh select x;
	deleteVehicle _veh;
	x = x + 1;
	Sleep 1;
};
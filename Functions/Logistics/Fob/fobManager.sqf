/////////////////////////
//Script made by Jochem//
/////////////////////////
_truck = _this select 0;

waitUntil {sleep 60;(!(alive _truck))};
deleteVehicle _truck;
sleep 5;
fobCount = fobCount - 1;
fobCount = fobCount - [objNull];

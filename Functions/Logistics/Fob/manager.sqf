/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_truck"];

waitUntil {sleep 60;(!(alive _truck))};
fobTrucks = fobtrucks - [_truck];
deleteVehicle _truck;
sleep 5;
fobCount = fobCount - 1;

/////////////////////////
//Script made by Jochem//
/////////////////////////
//[vehicleID,position,class/object,virtualizing,damage]
params["_class","_position","_virtualizing","_damage"];

vehicleArray pushBack[currentVehicleId,_position,_class,_virtualizing,_damage];
_return = currentVehicleId;
currentVehicleId = currentVehicleId + 1;

_return
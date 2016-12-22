/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_group"];

{
    deleteVehicle (objectParent _x);
    deleteVehicle _x;
} forEach (units _group);

/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_group"];

while{count (units _group) > 0}do{
    {
        deleteVehicle (objectParent _x);
    } forEach (units _group);
};
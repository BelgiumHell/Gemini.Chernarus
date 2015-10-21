/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_array"];

virtualizedArray = virtualizedArray - [_array];

_group = [(_array select 0),(_array select 1)]call Zen_SpawnGroup;

if(count (_array select 2) != 0)then{
    {
        _vehicle = (_x select 1) createVehicle (_x select 0);
        _crew = [];

        {
            _crew pushBack ((units _group) select _x);
        } forEach (_x select 2);

        [_crew,_vehicle,"All"] spawn Zen_MoveInVehicle;
    } forEach (_array select 2);
};

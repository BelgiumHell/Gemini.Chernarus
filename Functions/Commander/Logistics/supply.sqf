/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_group", "_array"];

if (vehicle (leader _group) isKindOf "air") then {
    [vehicle (leader _group), _array] spawn JOC_cmdLogHeli;
}else{
    [_group, _array] spawn JOC_cmdLogTruck;
};

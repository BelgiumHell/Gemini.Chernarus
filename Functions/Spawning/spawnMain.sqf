/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_fnc","_arg"];

if (!isNull HC1) then {
    [[_fnc,_arg],{(_this select 1) call (_this select 0)}] remoteExecCall ["BIS_fnc_call",HC1];
} else {
    [[_fnc,_arg],{(_this select 1) call (_this select 0)}] remoteExecCall ["BIS_fnc_call",2];
};
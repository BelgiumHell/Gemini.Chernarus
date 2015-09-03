/////////////////////////
//Script made by Jochem//
/////////////////////////
[]spawn JOC_taskUavAttack;

_trg = _this select 0;
_time = 600;

_x = 0;
while{_x < 600 and destroyed == 0}do{
    _text = format["%1/100 files received",(_x / 6)];
    [[[_text],JOC_taskGlobalChat],"BIS_fnc_spawn",true,true ] call BIS_fnc_MP;

    _x = _x + 6;
    Sleep 6;

    waitUntil{count(list _trg) > 0};
};

hacked = 1;
// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_SpawnGroup", _this] call Zen_StackAdd;
private ["_side", "_pos", "_classes", "_group"];

if !([_this, [["VOID"], ["ARRAY", "STRING"]], [[], ["STRING"]], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    (grpNull)
};

_pos = [(_this select 0)] call Zen_ConvertToPosition;
_classes = _this select 1;

if (typeName _classes != "ARRAY") then {
    _classes = [_classes];
};

_unitClasses = [];

{
    if (_x isKindOf "Man") then {
        _unitClasses pushBack [_x,_pos];
    } else {
        0 = ["Zen_SpawnGroup", format ["Non-human classname given at %1, can only spawn soldiers", _forEachIndex], _this] call Zen_PrintError;
        call Zen_StackPrint;
    };
} forEach _classes;


call Zen_StackRemove;
(_unitClasses)

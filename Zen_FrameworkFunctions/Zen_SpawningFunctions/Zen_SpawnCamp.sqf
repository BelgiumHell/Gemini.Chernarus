// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_SpawnCamp", _this] call Zen_StackAdd;
private ["_spawnPos", "_center", "_weaponHolder", "_weapon", "_objectsArray"];

if !([_this, [["VOID"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_center = [(_this select 0)] call Zen_ConvertToPosition;

0 = [_center, "Fireplace_burning_F", 0, (random 360), true] call Zen_SpawnVehicle;

_objectsArray = [];

{
    _spawnPos = [_center, (1 + random 3), (random 360)] call Zen_ExtendPosition;
    _object = createVehicle [_x, _spawnPos, [], 2, "NONE"];
    _objectsArray pushBack _object;
} forEach ["Land_WoodPile_f", "Land_TentDome_F", "Land_TentDome_F", "Land_Bench_F", "Land_Bench_F", "Land_CampingTable_F"];

0 = [_objectsArray, (random 360)] call Zen_RotateAsSet;

{
    if (["table", (typeOf _x)] call Zen_StringIsInString) then {
        /*_weaponHolder = ([["GroundWeaponHolder"], [_x]] call Zen_SpawnItemsOnTable) select 0;
        _weaponHolder enableSimulation true;
        _weapon = [[]] call Zen_ArrayGetRandom;
        _weaponHolder addMagazineCargoGlobal [((getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")) select 0), 5];
        _weaponHolder addWeaponCargoGlobal [_weapon, 1];*/
    };
} forEach _objectsArray;

call Zen_StackRemove;
if (true) exitWith {};

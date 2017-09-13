// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#define FILL_CAR(CLASS) \
        if ((isNull driver _vehicle) && _hasDriver) then { \
            _classCrewes pushBack CLASS; \
        }; \
        { \
            if (isNull (_vehicle turretUnit _x)) then { \
                _classCrewes pushBack CLASS; \
            }; \
        } forEach _vehicleTurrets;

#define FILL_AIRCRAFT(PILOT_CLASS,GUNNER_CLASS) \
        if ((isNull driver _vehicle) && _hasDriver) then { \
            _classCrewes pushBack PILOT_CLASS; \
        }; \
        { \
            if (isNull (_vehicle turretUnit _x)) then { \
                if (_forEachIndex == 0) then { \
                    _classCrewes pushBack PILOT_CLASS; \
                } else { \
                    _classCrewes pushBack GUNNER_CLASS; \
                }; \
            }; \
        } forEach _vehicleTurrets;

#include "Zen_StandardLibrary.sqf"

_Zen_stack_Trace = ["Zen_SpawnVehicleCrew",_this] call Zen_StackAdd;
private ["_vehicle","_classCrewes","_crewGroup","_vehicleConfigEntry","_side","_carclassCrew","_tankclassCrew","_heliclassCrew","_jetclassCrew","_heliclassPilot","_turretTypes","_hasDriver"];

if !([_this,[["OBJECT"],["SIDE"],["ARRAY","STRING"],["BOOL"]],[[],[],["STRING"]],1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_vehicle = _this select 0;

_vehicleConfigEntry = configFile >> "CfgVehicles" >> (typeOf _vehicle);
if ((toLower (getText (_vehicleConfigEntry >> "vehicleClass"))) == "autonomous") exitWith {
    createVehicleCrew _vehicle;
    call Zen_StackRemove;
    (crew _vehicle)
};

if (count _this > 1) then {
    _side = _this select 1;
} else {
    _side = [_vehicle] call Zen_GetSide;
};

_turretTypes = ["commander","gunner"];
ZEN_STD_Parse_GetArgument(_turretTypes,2)
ZEN_STD_Parse_GetArgumentDefault(_hasDriver,3,true)

_classCrewes = [];
_vehicleTurrets = [_vehicle,_turretTypes] call Zen_GetTurretPaths;

switch (_side) do {
    case west: {
        _carclassCrew = "b_soldier_f";
        _tankclassCrew = "b_crew_f";
        _heliclassPilot = "b_helipilot_f";
        _heliclassCrew = "b_helicrew_f";
        _jetclassCrew = "b_pilot_f";
    };
    case east: {
        _carclassCrew = "rhs_msv_emr_driver";
        _tankclassCrew = "rhs_msv_emr_combatcrew";
        _heliclassPilot = "rhs_pilot_combat_heli";
        _heliclassCrew = "rhs_pilot_transport_heli";
        _jetclassCrew = "rhs_pilot";
    };
    case resistance: {
        _carclassCrew = "i_soldier_f";
        _tankclassCrew = "i_crew_f";
        _heliclassPilot = "i_helipilot_f";
        _heliclassCrew = "i_helicrew_f";
        _jetclassCrew = "i_pilot_f";
    };
    case civilian: {
        _carclassCrew = "c_man_1";
        _tankclassCrew = "c_man_1";
        _heliclassPilot = "c_man_1";
        _heliclassCrew = "c_man_1";
        _jetclassCrew = "c_man_1";
    };
    default {
        0 = ["Zen_SpawnVehicleCrew","Invalid side given",_this] call Zen_PrintError;
        call Zen_StackPrint;
        _carclassCrew = "";
    };
};

if (_carclassCrew == "") exitWith {
    call Zen_StackRemove;
    (grpNull)
};

switch (toLower (getText (_vehicleConfigEntry >> "vehicleClass"))) do {
    case "car": {
        FILL_CAR(_carclassCrew)
    };
    case "support": {
        FILL_CAR(_carclassCrew)
    };
    case "ship": {
        FILL_CAR(_carclassCrew)
    };
    case "submarine": {
        FILL_CAR(_carclassCrew)
    };
    case "static": {
        {
            if (isNull (_vehicle turretUnit _x)) then {
                _classCrewes pushBack _carclassCrew;
            };
        } forEach _vehicleTurrets;
    };
    case "armored": {
        FILL_CAR(_tankclassCrew)
    };
    case "air": {
        switch (toLower (getText (_vehicleConfigEntry >> "textSingular"))) do {
            case (toLower (localize "str_Zen_Heli")): {
                FILL_AIRCRAFT(_heliclassPilot,_heliclassCrew)
            };
            case (toLower (localize "str_Zen_Gunship")): {
                FILL_AIRCRAFT(_heliclassPilot,_heliclassCrew)
            };
            case (toLower (localize "str_Zen_Jet")): {
                FILL_AIRCRAFT(_jetclassCrew,_jetclassCrew)
            };
            default {
                FILL_CAR(_heliclassPilot)
                0 = ["Zen_SpawnVehicleCrew","Vehicle is of unknown textSingular type",_this] call Zen_PrintError;
                call Zen_StackPrint;
            };
        };
    };
    default {
        FILL_CAR(_carclassCrew)
        0 = ["Zen_SpawnVehicleCrew","Vehicle is of unknown vehicleClass type",_this] call Zen_PrintError;
        call Zen_StackPrint;
    };
};

_crewGroup = [_vehicle,_classCrewes] call Zen_SpawnGroup;
0 = [_crewGroup,"Crew"] call Zen_SetAISkill;

if (_hasDriver) then {
    0 = [_crewGroup,_vehicle,"all",_turretTypes] call Zen_MoveInVehicle;
} else {
    0 = [_crewGroup,_vehicle,"turret",_turretTypes] call Zen_MoveInVehicle;
};

call Zen_StackRemove;
(_crewGroup)

/////////////////////////
//Script made by Jochem//
/////////////////////////

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "Functions\fn_compile.sqf";
#include "missionInit.sqf";
call compile preprocessFile "Baked_AIS\Baked_AIS_init.sqf";

// Gemini by Jochem
// Version = 0.6
// Tested with ArmA 3 <1.50>

enableSaving [false, false];

if(!isServer)exitWith{};

// Execution stops until the mission begins (past briefing), do not delete this line
sleep 1;

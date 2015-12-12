/////////////////////////
//Script made by Jochem//
/////////////////////////
titleText ["", "BLACK FADED", 0];
0.5 fadeSound 0;

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "Functions\fn_compile.sqf"
call compile preprocessFile "Baked_AIS\Baked_AIS_init.sqf";

// Gemini by Jochem
// Version = 0.6
// Tested with ArmA 3 <1.54>

enableSaving [false, false];

if(isServer)then{
    []call JOC_missionInit;
}else{
    []call JOC_clientInit;
};

/////////////////////////
//Script made by Jochem//
/////////////////////////

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "Functions\fn_compile.sqf";
call compile preprocessFile "Baked_AIS\Baked_AIS_init.sqf";

// Gemini by Jochem
// Version = 0.6
// Tested with ArmA 3 <1.50>

enableSaving [false, false];

if(isServer)then{
    []call JOC_missionInit
}else{
    sleep 1;
    startLoadingScreen ["Loading My Mission"];
    sleep 1;
    []call JOC_clientInit;
};

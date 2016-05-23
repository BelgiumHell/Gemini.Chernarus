/////////////////////////
//Script made by Jochem//
/////////////////////////
sleep 1;

titleText ["", "BLACK FADED", 0];
startLoadingScreen["Loading..."];

JOC_serverLoaded = false;

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "Functions\fn_compile.sqf"

// Gemini by Jochem
// Version = 0.6
// Tested with ArmA 3 <1.58>

enableSaving [false, false];

if(isServer)then{
    inidbiDB1 = ["new", "GEMINI1"] call OO_INIDBI;
    inidbiDB2 = ["new", "GEMINI2"] call OO_INIDBI;
    []spawn JOC_missionInit;
}else{
    player enableSimulation false;
    player allowDamage false;
};

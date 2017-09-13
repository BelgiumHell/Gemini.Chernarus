/////////////////////////
//Script made by Jochem//
/////////////////////////
//Airfield
[] call JOC_cmdInitAirfield;

//Arty
[] call JOC_cmdInitArty;

//Base
[] call JOC_cmdInitBase;

//Camp
[] call JOC_cmdInitCamp;

//Factory
[] call JOC_cmdInitFactory;

//Mines
//[] call JOC_cmdInitMine; -not persistant + AI is too stupid to not get killed by them, even if they know they're there

//Radiotowers
[] call JOC_cmdInitRadio;

//Roadblocks
//[] call JOC_cmdInitRoadblock; -doesn't work very well

//Static AA on rooftops
[] call JOC_cmdInitStatic;

//Town
[] call JOC_cmdInitTown;

//AA - leave as last in order
[] call JOC_cmdInitAA;

/////////////////////////
//Script made by Jochem//
/////////////////////////

[position, priority, type, marker, west]


//Attack

//Command

//Defend

//Init
//JOC_cmdInitAA = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\aa.sqf";
//JOC_cmdInitAirfield = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\airfield.sqf";
//JOC_cmdInitArty = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\arty.sqf";
JOC_cmdInitBase = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\base.sqf";
JOC_cmdInitIndTown compileFinal preprocessFileLineNumbers "Functions\Commander\Init\indTown.sqf";
//JOC_cmdInitMine = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\mine.sqf";
//JOC_cmdInitRadio = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\radio.sqf";
JOC_cmdInitTown = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\town.sqf";

//Logistics

//Misc

//Patrol









enemyforce = [];

//First regiment
//Create base

//Vehicle depot
0 = [(position object), 0.0, call (compile (preprocessFileLineNumbers "Data\compositions\compositionname.sqf"))] call BIS_fnc_ObjectsMapper;


//Populate airfields

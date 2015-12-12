/////////////////////////
//Script made by Jochem//
/////////////////////////
//Attack

//Command
JOC_cmdCmdreqSupport = compileFinal preprocessFileLineNumbers "Functions\Commander\Command\reqSupport.sqf";

//Defend
JOC_cmdDefArmor = compileFinal preprocessFileLineNumbers "Functions\Commander\Defend\armor.sqf";
JOC_cmdDefArty = compileFinal preprocessFileLineNumbers "Functions\Commander\Defend\arty.sqf";
JOC_cmdDefCas = compileFinal preprocessFileLineNumbers "Functions\Commander\Defend\cas.sqf";
JOC_cmdDefConvoy = compileFinal preprocessFileLineNumbers "Functions\Commander\Defend\convoy.sqf";
JOC_cmdDefHeli = compileFinal preprocessFileLineNumbers "Functions\Commander\Defend\heli.sqf";
JOC_cmdDefNear = compileFinal preprocessFileLineNumbers "Functions\Commander\Defend\near.sqf";
JOC_cmdDefRetreat = compileFinal preprocessFileLineNumbers "Functions\Commander\Defend\retreat.sqf";

//Init
JOC_cmdInitAA = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\aa.sqf";
JOC_cmdInitAirfield = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\airfield.sqf";
JOC_cmdInitArty = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\arty.sqf";
JOC_cmdInitBase = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\base.sqf";
JOC_cmdInitFactory = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\factory.sqf";
JOC_cmdInitMine = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\mine.sqf";
JOC_cmdInitRadio = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\radio.sqf";
JOC_cmdInitTown = compileFinal preprocessFileLineNumbers "Functions\Commander\Init\town.sqf";

//Logistics

//Misc
JOC_monitorStrategic = compileFinal preprocessFileLineNumbers "Functions\Commander\Misc\monitorStrategic.sqf";

//Patrol

//Spawning
JOC_cmdSpawnBase = compileFinal preprocessFileLineNumbers "Functions\Commander\Spawning\base.sqf";
JOC_cmdSpawnZone = compileFinal preprocessFileLineNumbers "Functions\Commander\Spawning\zone.sqf";

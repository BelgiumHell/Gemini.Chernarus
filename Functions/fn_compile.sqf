/////////////////////////
//Script made by Jochem//
/////////////////////////

//AI
JOC_spawnZone = compileFinal preprocessFileLineNumbers "Functions\AI\spawnZone.sqf";
JOC_spawnAirfield = compileFinal preprocessFileLineNumbers "Functions\AI\spawnAirfield.sqf";
JOC_taskJet = compileFinal preprocessFileLineNumbers "Functions\AI\taskJet.sqf";
JOC_jetMonitor = compileFinal preprocessFileLineNumbers "Functions\AI\jetMonitor.sqf";
JOC_radar = compileFinal preprocessFileLineNumbers "Functions\AI\radar.sqf";
JOC_mineField = compileFinal preprocessFileLineNumbers "Functions\AI\mineField.sqf";
JOC_radioTower = compileFinal preprocessFileLineNumbers "Functions\AI\radioTower.sqf";
JOC_arty = compileFinal preprocessFileLineNumbers "Functions\AI\arty.sqf";
JOC_patrol = compileFinal preprocessFileLineNumbers "Functions\AI\patrol.sqf";

//Bluforce tracking
JOC_bftManager = compileFinal preprocessFileLineNumbers "Functions\BFT\manager.sqf";

//Caching
JOC_cacheInit = compileFinal preprocessFileLineNumbers "Functions\Caching\cacheInit.sqf";
JOC_cache = compileFinal preprocessFileLineNumbers "Functions\Caching\cache.sqf";
JOC_unCache = compileFinal preprocessFileLineNumbers "Functions\Caching\unCache.sqf";
JOC_cacheGroup = compileFinal preprocessFileLineNumbers "Functions\Caching\cacheGroup.sqf";

//Commander
JOC_cmdManager = compileFinal preprocessFileLineNumbers "Functions\Commander\manager.sqf";
JOC_cmdAttack = compileFinal preprocessFileLineNumbers "Functions\Commander\attack.sqf";
JOC_cmdHeli = compileFinal preprocessFileLineNumbers "Functions\Commander\heli.sqf";
JOC_cmdHeliMonitor = compileFinal preprocessFileLineNumbers "Functions\Commander\heliMonitor.sqf";

//Init
JOC_initAA = compileFinal preprocessFileLineNumbers "Functions\Init\initAA.sqf";
JOC_initTowns = compileFinal preprocessFileLineNumbers "Functions\Init\initTowns.sqf";
JOC_initAirfields = compileFinal preprocessFileLineNumbers "Functions\Init\initAirfields.sqf";
JOC_initMines = compileFinal preprocessFileLineNumbers "Functions\Init\initMines.sqf";
JOC_initArty = compileFinal preprocessFileLineNumbers "Functions\Init\initArty.sqf";
JOC_initRadio = compileFinal preprocessFileLineNumbers "Functions\Init\initRadio.sqf";
JOC_initPatrols = compileFinal preprocessFileLineNumbers "Functions\Init\initPatrols.sqf";

//Loadouts
JOC_arsenal = compileFinal preprocessFileLineNumbers "Functions\Loadouts\arsenal.sqf";
JOC_loadoutMaster = compileFinal preprocessFileLineNumbers "Functions\Loadouts\master.sqf";

//Logistics
#include "Logistics\fn_logistics_compile.sqf";
JOC_crateInit = compileFinal preprocessFileLineNumbers "Functions\Logistics\crateInit.sqf";

//Performance
JOC_perfLoop = compileFinal preprocessFileLineNumbers "Functions\Performance\loop.sqf";
JOC_objectRemove = compileFinal preprocessFileLineNumbers "Functions\Performance\objectRemove.sqf";
JOC_itemRemove = compileFinal preprocessFileLineNumbers "Functions\Performance\itemRemove.sqf";

//Player
JOC_playerLoop = compileFinal preprocessFileLineNumbers "Functions\Player\playerLoop.sqf";
JOC_playerClick = compileFinal preprocessFileLineNumbers "Functions\Player\click.sqf";
JOC_playerButton = compileFinal preprocessFileLineNumbers "Functions\Player\button.sqf";

//Tasks
#include "Tasks\fn_task_compile.sqf";
JOC_taskManager = compileFinal preprocessFileLineNumbers "Functions\Tasks\taskManager.sqf";
JOC_task_boat = compileFinal preprocessFileLineNumbers "Functions\Tasks\boat.sqf";
JOC_taskCrash = compileFinal preprocessFileLineNumbers "Functions\Tasks\crashedChopper.sqf";
JOC_taskKill = compileFinal preprocessFileLineNumbers "Functions\Tasks\kill.sqf";
JOC_taskRescue = compileFinal preprocessFileLineNumbers "Functions\Tasks\rescue.sqf";
JOC_taskUav = compileFinal preprocessFileLineNumbers "Functions\Tasks\uav.sqf";

//Towns
JOC_occupy = compileFinal preprocessFileLineNumbers "Functions\Towns\occupy.sqf";
JOC_indTown = compileFinal preprocessFileLineNumbers "Functions\Towns\indTown.sqf";
JOC_monitorTown = compileFinal preprocessFileLineNumbers "Functions\Towns\monitor.sqf";

//vehicle
JOC_vehInit = compileFinal preprocessFileLineNumbers "Functions\Vehicle\vehInit.sqf";
JOC_vehRespawn = compileFinal preprocessFileLineNumbers "Functions\Vehicle\vehicle_respawn.sqf";
JOC_tow = compileFinal preprocessFileLineNumbers "Functions\Vehicle\tow.sqf";
JOC_service = compileFinal preprocessFileLineNumbers "Functions\Vehicle\service.sqf";
JOC_handleVehDamage = compileFinal preprocessFileLineNumbers "Functions\Vehicle\handleDamage.sqf";
JOC_towAttach = compileFinal preprocessFileLineNumbers "Functions\Vehicle\Tow\attach.sqf";
JOC_towDetach = compileFinal preprocessFileLineNumbers "Functions\Vehicle\Tow\detach.sqf";
JOC_vehCDU = compileFinal preprocessFileLineNumbers "Functions\Vehicle\cdu.sqf";
JOC_garage = compileFinal preprocessFileLineNumbers "Functions\Vehicle\Garage\main.sqf";
JOC_garageFnc = compileFinal preprocessFileLineNumbers "Functions\Vehicle\Garage\garageFnc.sqf";
JOC_garageScrap = compileFinal preprocessFileLineNumbers "Functions\Vehicle\Garage\scrap.sqf";

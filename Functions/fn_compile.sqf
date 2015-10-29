/////////////////////////
//Script made by Jochem//
/////////////////////////
//AI
JOC_aiManager = compileFinal preprocessFileLineNumbers "Functions\AI\aiManager.sqf";
JOC_cache = compileFinal preprocessFileLineNumbers "Functions\AI\cache.sqf";
JOC_cacheUnits = compileFinal preprocessFileLineNumbers "Functions\AI\cacheUnits.sqf";
JOC_virtualize = compileFinal preprocessFileLineNumbers "Functions\AI\virtualize.sqf";
JOC_unCache = compileFinal preprocessFileLineNumbers "Functions\AI\unCache.sqf";
JOC_unVirtualize = compileFinal preprocessFileLineNumbers "Functions\AI\unVirtualize.sqf";

//Bluforce tracking
JOC_bftManager = compileFinal preprocessFileLineNumbers "Functions\BFT\manager.sqf";

//Commander
#include "Commander\fn_commander_compile.sqf";
JOC_cmdCreateLocations = compileFinal preprocessFileLineNumbers "Functions\Commander\createLocations.sqf";
JOC_cmdCreateEnemy = compileFinal preprocessFileLineNumbers "Functions\Commander\createEnemy.sqf";

//Core

//Init
JOC_initDepot = compileFinal preprocessFileLineNumbers "Functions\Init\initDepot.sqf";
JOC_initPlayerBase = compileFinal preprocessFileLineNumbers "Functions\Init\initPlayerBase.sqf";

//Loadouts
JOC_arsenal = compileFinal preprocessFileLineNumbers "Functions\Loadouts\arsenal.sqf";
JOC_loadoutMaster = compileFinal preprocessFileLineNumbers "Functions\Loadouts\master.sqf";

//Logistics
#include "Logistics\fn_logistics_compile.sqf";
JOC_crateInit = compileFinal preprocessFileLineNumbers "Functions\Logistics\crateInit.sqf";
JOC_spawnComposition = compileFinal preprocessFileLineNumbers "Functions\Logistics\spawnComposition.sqf";

//Misc
JOC_findCenter = compileFinal preprocessFileLineNumbers "Functions\Misc\findCenter.sqf";

//Performance
JOC_perfLoop = compileFinal preprocessFileLineNumbers "Functions\Performance\loop.sqf";
JOC_objectRemove = compileFinal preprocessFileLineNumbers "Functions\Performance\objectRemove.sqf";
JOC_itemRemove = compileFinal preprocessFileLineNumbers "Functions\Performance\itemRemove.sqf";

//Player
JOC_playerLoop = compileFinal preprocessFileLineNumbers "Functions\Player\loop.sqf";
JOC_playerClick = compileFinal preprocessFileLineNumbers "Functions\Player\click.sqf";
JOC_playerButton = compileFinal preprocessFileLineNumbers "Functions\Player\button.sqf";

//Tasks
/*#include "Tasks\fn_task_compile.sqf";
JOC_taskManager = compileFinal preprocessFileLineNumbers "Functions\Tasks\taskManager.sqf";
JOC_task_boat = compileFinal preprocessFileLineNumbers "Functions\Tasks\boat.sqf";
JOC_taskCrash = compileFinal preprocessFileLineNumbers "Functions\Tasks\crashedChopper.sqf";
JOC_taskKill = compileFinal preprocessFileLineNumbers "Functions\Tasks\kill.sqf";
JOC_taskRescue = compileFinal preprocessFileLineNumbers "Functions\Tasks\rescue.sqf";
JOC_taskUav = compileFinal preprocessFileLineNumbers "Functions\Tasks\uav.sqf";
JOC_getMainTasks = compileFinal preprocessFileLineNumbers "Functions\Tasks\getMainTasks.sqf";
JOC_setMainTask = compileFinal preprocessFileLineNumbers "Functions\Tasks\setMainTask.sqf";*/

//vehicle
#include "Vehicle\fn_vehicle_compile.sqf";
JOC_vehInit = compileFinal preprocessFileLineNumbers "Functions\Vehicle\vehInit.sqf";
JOC_service = compileFinal preprocessFileLineNumbers "Functions\Vehicle\service.sqf";
JOC_vehCDU = compileFinal preprocessFileLineNumbers "Functions\Vehicle\cdu.sqf";

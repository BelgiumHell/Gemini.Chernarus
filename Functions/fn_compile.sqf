/////////////////////////
//Script made by Jochem//
/////////////////////////
JOC_missionInit = compileFinal preprocessFileLineNumbers "missionInit.sqf";

//AI
JOC_aiManager = compileFinal preprocessFileLineNumbers "Functions\AI\aiManager.sqf";
JOC_cleanUp = compileFinal preprocessFileLineNumbers "Functions\AI\cleanUp.sqf";
JOC_getVehicleIndex = compileFinal preprocessFileLineNumbers "Functions\AI\getVehicleIndex.sqf";
JOC_virtualize = compileFinal preprocessFileLineNumbers "Functions\AI\virtualize.sqf";
JOC_unVirtualize = compileFinal preprocessFileLineNumbers "Functions\AI\unVirtualize.sqf";

//Bluforce tracking
JOC_bftManager = compileFinal preprocessFileLineNumbers "Functions\BFT\manager.sqf";

//Commander
#include "Commander\fn_commander_compile.sqf";
JOC_cmdCreateLocations = compileFinal preprocessFileLineNumbers "Functions\Commander\createLocations.sqf";
JOC_cmdCreateEnemy = compileFinal preprocessFileLineNumbers "Functions\Commander\createEnemy.sqf";

//Core
JOC_coreGetGroup = compileFinal preprocessFileLineNumbers "Functions\Core\getGroup.sqf";
JOC_coreGetId = compileFinal preprocessFileLineNumbers "Functions\Core\getId.sqf";
JOC_coreGetUnit = compileFinal preprocessFileLineNumbers "Functions\Core\getUnit.sqf";
JOC_coreGetVehicle = compileFinal preprocessFileLineNumbers "Functions\Core\getVehicle.sqf";
JOC_coreSetId = compileFinal preprocessFileLineNumbers "Functions\Core\setId.sqf";

//Diary
JOC_createDiary = compileFinal preprocessFileLineNumbers "Functions\Diary\createDiary.sqf";

//Init
JOC_initDepot = compileFinal preprocessFileLineNumbers "Functions\Init\initDepot.sqf";
JOC_initPlayerBase = compileFinal preprocessFileLineNumbers "Functions\Init\initPlayerBase.sqf";

//Loadouts
JOC_arsenal = compileFinal preprocessFileLineNumbers "Functions\Loadouts\arsenal.sqf";
JOC_loadoutMaster = compileFinal preprocessFileLineNumbers "Functions\Loadouts\master.sqf";

//Logistics
#include "Logistics\fn_logistics_compile.sqf";
JOC_spawnComposition = compileFinal preprocessFileLineNumbers "Functions\Logistics\spawnComposition.sqf";

//Misc
JOC_drawLine = compileFinal preprocessFileLineNumbers "Functions\Misc\drawLine.sqf";
JOC_findCenter = compileFinal preprocessFileLineNumbers "Functions\Misc\findCenter.sqf";
JOC_getGroup = compileFinal preprocessFileLineNumbers "Functions\Misc\getGroup.sqf";
JOC_getNearest = compileFinal preprocessFileLineNumbers "Functions\Misc\getNearest.sqf";
JOC_groupExists = compileFinal preprocessFileLineNumbers "Functions\Misc\groupExists.sqf";
JOC_nearestPlayers = compileFinal preprocessFileLineNumbers "Functions\Misc\nearestPlayers.sqf";
JOC_playersNear = compileFinal preprocessFileLineNumbers "Functions\Misc\playersNear.sqf";
JOC_publicArray = compileFinal preprocessFileLineNumbers "Functions\Misc\publicArray.sqf";
JOC_setGroupID = compileFinal preprocessFileLineNumbers "Functions\Misc\setGroupID.sqf";

//Performance
JOC_perfLoop = compileFinal preprocessFileLineNumbers "Functions\Performance\loop.sqf";
JOC_objectRemove = compileFinal preprocessFileLineNumbers "Functions\Performance\objectRemove.sqf";
JOC_itemRemove = compileFinal preprocessFileLineNumbers "Functions\Performance\itemRemove.sqf";

//Player
JOC_playerButton = compileFinal preprocessFileLineNumbers "Functions\Player\button.sqf";
JOC_playerClick = compileFinal preprocessFileLineNumbers "Functions\Player\click.sqf";
JOC_playerInit = compileFinal preprocessFileLineNumbers "Functions\Player\init.sqf";
JOC_playerLoop = compileFinal preprocessFileLineNumbers "Functions\Player\loop.sqf";
JOC_playerSmkGren = compileFinal preprocessFileLineNumbers "Functions\Player\smkGren.sqf";

//Save
JOC_savePrepUnit = compileFinal preprocessFileLineNumbers "Functions\Save\prepUnit.sqf";
JOC_savePrepVehicle = compileFinal preprocessFileLineNumbers "Functions\Save\prepVehicle.sqf";
JOC_saveMission = compileFinal preprocessFileLineNumbers "Functions\Save\save.sqf";

//Spawning
JOC_spawnBase = compileFinal preprocessFileLineNumbers "Functions\Spawning\base.sqf";
JOC_spawnConvoy = compileFinal preprocessFileLineNumbers "Functions\Spawning\convoy.sqf";
JOC_spawnGroup = compileFinal preprocessFileLineNumbers "Functions\Spawning\group.sqf";
JOC_spawnUnit = compileFinal preprocessFileLineNumbers "Functions\Spawning\unit.sqf";
JOC_spawnVehicle = compileFinal preprocessFileLineNumbers "Functions\Spawning\vehicle.sqf";
JOC_spawnZone = compileFinal preprocessFileLineNumbers "Functions\Spawning\zone.sqf";

//Vehicle
JOC_vehInit = compileFinal preprocessFileLineNumbers "Functions\Vehicle\init.sqf";
JOC_service = compileFinal preprocessFileLineNumbers "Functions\Vehicle\service.sqf";
JOC_vehCDU = compileFinal preprocessFileLineNumbers "Functions\Vehicle\cdu.sqf";
JOC_vehRespawn = compileFinal preprocessFileLineNumbers "Functions\Vehicle\respawn.sqf";
JOC_vehScrap = compileFinal preprocessFileLineNumbers "Functions\Vehicle\scrap.sqf";

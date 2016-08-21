/////////////////////////
//Script made by Jochem//
/////////////////////////

//Building
JOC_buildBuild = compileFinal preprocessFileLineNumbers "Functions\Logistics\Building\build.sqf";
JOC_buildInit = compileFinal preprocessFileLineNumbers "Functions\Logistics\Building\init.sqf";
JOC_buildPlaceObject = compileFinal preprocessFileLineNumbers "Functions\Logistics\Building\placeObject.sqf";

//Crate
JOC_crateInit = compileFinal preprocessFileLineNumbers "Functions\Logistics\Crate\init.sqf";
JOC_crateMat = compileFinal preprocessFileLineNumbers "Functions\Logistics\Crate\mat.sqf";
JOC_crateMmg = compileFinal preprocessFileLineNumbers "Functions\Logistics\Crate\mmg.sqf";

//Depot
JOC_depotSpawnObject = compileFinal preprocessFileLineNumbers "Functions\Logistics\Depot\spawnObject.sqf";

//Fob
JOC_fobDeploy = compileFinal preprocessFileLineNumbers "Functions\Logistics\Fob\deploy.sqf";
JOC_fobInit = compileFinal preprocessFileLineNumbers "Functions\Logistics\Fob\init.sqf";
JOC_fobManager = compileFinal preprocessFileLineNumbers "Functions\Logistics\Fob\manager.sqf";
JOC_fobSpawn = compileFinal preprocessFileLineNumbers "Functions\Logistics\Fob\spawn.sqf";
JOC_fobUndeploy = compileFinal preprocessFileLineNumbers "Functions\Logistics\Fob\undeploy.sqf";
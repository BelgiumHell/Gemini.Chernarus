/////////////////////////
//Script made by Jochem//
/////////////////////////

//Note to user:
//This is the only file in the mission meant to be edited, also the only one containing good commenting on variables.
//Do not edit below 'do not edit' mark or an other file in this mission without knowledge of ArmA SQF scripting.

//Parameters *FREE TO EDIT*
//Classnames
infantryPool = [
    ["rhs_vdv_sergeant","rhs_vdv_junior_sergeant"],//0-leader
    ["rhs_vdv_RShG2","rhs_vdv_LAT"],//1-rifleman(AT)
    ["rhs_vdv_rifleman","rhs_vdv_efreitor","rhs_vdv_grenadier"],//2-rifleman/grenadier
    ["rhs_vdv_machinegunner"],//3-MG
    ["rhs_vdv_machinegunner_assistant"],//4-MG ammo
    ["rhs_vdv_at"],//5-AT
    ["rhs_vdv_strelok_rpg_assist"],//6-AT ammo
    ["rhs_vdv_aa"],//7-AA
    ["rhs_vdv_marksman"],//8-marksman
    ["rhs_vdv_engineer"],//9-engineer
    ["rhs_vdv_medic"]//10-medic
];
teamComp = [
    [[0],[3],[4],[1,2]],//0-regular
    [[0],[5],[5],[6]],//1-AT
    [[0],[7],[7],[1,2]],//2-AA
    [[0],[9],[9],[1,2]],//3-engineer
    []
];
sfPool = ["rhs_vdv_recon_marksman_vss","rhs_vdv_recon_marksman_asval","rhs_vdv_recon_grenadier_scout","rhs_vdv_recon_rifleman_scout","rhs_vdv_recon_rifleman_scout_akm"];//Special forces classnames
staticPoolAA = [
    ["RHS_ZU23_VDV"],//0-AA
    ["rhs_Kornet_9M133_2_vdv"],//1-AT
    ["rhs_KORD_high_VDV"]//2-MG
];
carPool = ["rhs_tigr_m_vdv","rhs_tigr_sts_vdv","rhs_tigr_vdv"];//car classnames
truckPool = ["RHS_Ural_VDV_01","RHS_Ural_Open_VDV_01"];//truck classnames
apcPool = ["rhs_btr80a_vdv","rhs_btr80_vdv"];//apc classnames
ifvPool = ["rhs_bmd4ma_vdv","rhs_bmd4_vdv","rhs_bmp2k_vdv"];//ifv classnames
tankPool = ["rhs_t90a_tv","rhs_t80ue1"];//tank classnames
supportPool = [
    ["RHS_Ural_Fuel_VDV_01"],//0-fuel
    ["rhs_gaz66_repair_vdv"],//1-repair
    ["rhs_gaz66_ammo_vdv"]//2-ammo
];
heliPool = [
    ["RHS_Mi8AMT_vdv","RHS_Mi8mt_Cargo_vdv","RHS_Mi8MTV3_vdv"],//0-transport
    ["RHS_Mi24V_vdv","RHS_Ka52_vvs"]//1-attack
];
jetPool = [
    ["RHS_Su25SM_KH29_vvs"],//0-AG
    ["RHS_T50_vvs_blueonblue"]//1-AA
];
crewClass = ["rhs_vdv_combatcrew","rhs_vdv_combatcrew"];//Crewman classname
pilotClass = [["rhs_pilot_combat_heli"],["rhs_pilot"]];//Pilot classname
officerClass = [""];//Officer classname
artyClass = "rhs_2s3_tv";    //Arty classname
aaClass = "rhs_zsu234_aa"; //AA classname
fobClass = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy"; //Fob classname
emptyClass = "Land_Airport_center_F";  //Large object, don't change or delete
roofPool = ["Land_Offices_01_V1_F","Land_WIP_F"];   //Buildings that can have statics on their roof
barrackPool = [];

//Markers
blackTowns = ["Sagonisi"];  //Blacklist towns to not get any strategic value
blackMarkers = ["mrk_safeZone"];    //Markers enemies will not spawn in nor patrol
airfieldMarkers = ["mrk_airfield_0","mrk_airfield_1","mrk_airfield_2","mrk_airfield_3"];   //Markers for airfields

//Objects
arsenalBoxes = [arsenal1,arsenal2];    //All pre-placed boxes that need to be a virtual arsenal

//Variables
fobLimit = 5;   //Max number of FOB trucks active

//****MOVE TO PARAMS****//
CHVD_allowNoGrass = false; // Set 'false' if you want to disable "Low" option for terrain (default: true)
CHVD_maxView = 12000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 12000; // Set maximimum object view distance (default: 12000)

//////DO NOT EDIT//////

//Create marker used by position generation
"mrk_area" setMarkerPos [worldSize/2,worldSize/2];
"mrk_area" setMarkerSize [worldSize/2,worldSize/2];
"mrk_area" setMarkerAlpha 0;

//Vars needed by scripts
jetTargets = [];
heliTargets = [];
activeTasks = [];   //Not being used
fobTrucks = [];
vehArray = [];
readyArray = [];
buildObjects = [];
radars = nearestObjects [getMarkerPos "mrk_area",["Land_Radar_F","Land_Radar_Small_F"],worldSize*2.0^0.5];
radiotowers = nearestObjects [getMarkerPos "mrk_area",["Land_TTowerBig_1_F","Land_TTowerBig_2_F"],worldSize*2.0^0.5];
jetActive = false;
jetReady = true;



//Virtualizing
unitArray = [];
unitArrayChanged = [];
vehicleArray = [];
vehicleArrayChanged = [];
currentGroupId = 0;
currentUnitId = 0;
currentVehicleId = 0;

//AI Commander
strategicArray = [];
orderArray = [];
requestArray = [];
assignedArray = [];
currentRequestID = 0;



//Get a list of all objects placed in editor
objectsStart = nearestObjects [[worldSize/2,worldSize/2], ["all"], (worldSize*2^0.5)];
{
    _x enableSimulationGlobal false;
} forEach objectsStart;

//Read database
/*saveCount = 0;
_inidbi = 0;
_dbSaved = false;
if(["read", ["header", "saved",false]] call inidbiDB1)then{
    _inidbi = inidbiDB1;
    _dbSaved = true;
    saveCount = 1;
};
if(["read", ["header", "saved",false]] call inidbiDB2)then{
    _inidbi = inidbiDB2;
    _dbSaved = true;
    saveCount = 0;
};

if(_dbSaved && (paramsArray select 0) == 1)then{
    []call JOC_saveLoad;
}else{
    "delete" call inidbiDB1;
    "delete" call inidbiDB2;

    []call JOC_cmdCreateLocations;

    [[],{
        progressLoadingScreen 0.3;
    }] remoteExec ["BIS_fnc_spawn", 0, true];

    []call JOC_cmdCreateEnemy;

    [[],{
            progressLoadingScreen 0.9;
    }] remoteExec ["BIS_fnc_spawn", 0, true];

    //This is saved in the beginning because it would kill the server trying to do it every 5 minutes
    {
        ["write", ["header", format["objectsAdded_%1",_forEachIndex], [typeOf _x, getPosASL _x, getDir _x]]] call inidbiDB1;
        ["write", ["header", format["objectsAdded_%1",_forEachIndex], [typeOf _x, getPosASL _x, getDir _x]]] call inidbiDB2;
    } forEach ((nearestObjects [[worldSize/2,worldSize/2], ["all"], (worldSize*2^0.5)]) - objectsStart - ([worldSize/2,worldSize/2] nearEntities [["all"],(worldSize*2^0.5)]));
};*/

//Public var for local scripts
publicVariable "airfieldMarkers";
publicVariable "arsenalBoxes";
publicVariable "CHVD_allowNoGrass";
publicVariable "CHVD_maxView";
publicVariable "CHVD_maxObj";
publicVariable "unitArray";
publicVariable "vehicleArray";
publicVariable "currentGroupId";
publicVariable "currentUnitId";
publicVariable "currentVehicleId";
/*
//End loading screen
[[],{
    endLoadingScreen;
    JOC_serverLoaded = true;
    if(!isServer)then{
        waitUntil{!isNil{JOC_playerInit}};
        []call JOC_playerInit;
    };
}] remoteExec ["BIS_fnc_spawn", 0, true];

[]call JOC_initPlayerBase;
[]call JOC_initDepot;
[]call JOC_vehRespawn;


//Using CBA EH should be faster than using spawn (plz don't hate me)
[{
    if(!isNull HC1)then{
        {[]call JOC_aiManager;} remoteExecCall ["bis_fnc_call", HC1]; 
    }else{
        {[]call JOC_aiManager;} remoteExecCall ["bis_fnc_call", 2]; 
    };
}, 5, []]call CBA_fnc_addPerFrameHandler;
//[JOC_perfLoop, 60, []]call CBA_fnc_addPerFrameHandler;
//[JOC_saveSave, 300, []]call CBA_fnc_addPerFrameHandler;
//[JOC_cmdMiscRadar, 10, []]call CBA_fnc_addPerFrameHandler;
//[JOC_vehRespawn, 3600, []]call CBA_fnc_addPerFrameHandler;
[JOC_cmdCmdLoop, 30, []]call CBA_fnc_addPerFrameHandler;
/*{
    _marker = _x select 3;
    _marker setMarkerAlpha 0;
} forEach strategicArray;*/

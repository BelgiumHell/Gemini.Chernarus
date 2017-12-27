/////////////////////////
//Script made by Jochem//
/////////////////////////
{
    //Note to user:
    //This is the only file in the mission meant to be edited, also the only one containing 'good' commenting on variables.
    //Do not edit below 'do not edit' mark or an other file in this mission without knowledge of ArmA SQF scripting.

    //Parameters *FREE TO EDIT*
    //Classnames
    poolInfantry = ["rhs_vdv_rifleman", "rhs_vdv_efreitor", "rhs_vdv_engineer", "rhs_vdv_grenadier", "rhs_vdv_at", "rhs_vdv_aa", "rhs_vdv_strelok_rpg_assist", "rhs_vdv_junior_sergeant", "rhs_vdv_machinegunner", "rhs_vdv_machinegunner_assistant", "rhs_vdv_marksman", "rhs_vdv_medic", "rhs_vdv_LAT", "rhs_vdv_RShG2", "rhs_vdv_sergeant"];//Infantry classnames
    poolSf       = ["rhs_vdv_recon_marksman_vss", "rhs_vdv_recon_marksman_asval", "rhs_vdv_recon_grenadier_scout", "rhs_vdv_recon_rifleman_scout", "rhs_vdv_recon_rifleman_scout_akm"];//Special forces classnames (#getRekt)
    poolStaticAA = ["RHS_ZU23_VDV"];//AA statics
    poolStaticAT = [];//AT statics
    poolStaticMG = [];//MG statics
    poolCar      = ["rhs_tigr_m_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_vdv"];//Car classnames
    poolTruck    = ["rhs_kamaz5350_vdv", "rhs_kamaz5350_open_vdv"];//Truck classnames
    poolApc      = ["rhs_btr80a_vdv"];//APC classnames
    poolIfv      = ["rhs_bmd4ma_vdv", "rhs_bmd4_vdv", "rhs_bmp2k_vdv", "rhs_bmp2d_vdv", "rhs_bmd2m"];//IFV classnames
    poolTank     = ["rhs_t90a_tv", "rhs_t80ue1", "rhs_t90_tv", "rhs_t80um"];//Tank classnames
    poolSupport  = ["RHS_Ural_Fuel_VDV_01", "rhs_gaz66_ammo_vdv"];//Support classnames
    poolAir      = ["RHS_Mi8AMT_vdv", "RHS_Mi8mt_Cargo_vdv", "RHS_Mi8MTV3_vdv"];//Transport helicopter classnames
    poolCas      = ["RHS_Mi24V_vdv", "RHS_Ka52_vvs", "rhs_mi28n_vvs"];//Cas helicopters classnames
    poolJetAG    = ["RHS_Su25SM_KH29_vvs"];//Jet classnames (anti-ground)
    poolJetAA    = ["RHS_T50_vvs_blueonblue"];//Jet classnames (anti-air)
    classCrew    = "rhs_vdv_combatcrew";//Crewman classname
    classPilot   = "rhs_pilot";//Pilot classname
    classOfficer = ""; //Officer classname
    classArty    = "rhs_2s3_tv";//Arty classname
    classAA      = "rhs_zsu234_aa";//AA classname
    classFob     = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy";//Fob classname
    classEmpty   = "Land_Airport_center_F";//Large object, don't change or delete
    poolRoof     = ["Land_Offices_01_V1_F", "Land_WIP_F"];//Buildings with roofs statics can spawn on

    //Markers
    blackTowns = ["Sagonisi"];  //Blacklist towns to not get any strategic value
    blackMarkers = ["mrk_safeZone"];    //Markers enemies will not spawn in nor patrol
    airfieldMarkers = ["mrk_airfield_0", "mrk_airfield_1", "mrk_airfield_2", "mrk_airfield_3"];   //Markers for airfields

    //Objects
    leaderArray = []; //All leading elements, this is also used for chain of command
    arsenalBoxes = [arsenal1, arsenal2];    //All pre-placed boxes that need to be a virtual arsenal
    logisticsArray = ["l1", "l2", "l3", "l4"]; //All units that will be able to use the building crate
    logisticsVehArray = ["B_APC_Tracked_01_CRV_F"]; //All vehicles that can tow (might be broken atm, do not expect this to work properly)
    motorizedArray = ["rhsusf_M1117_W", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_MK19"];    //All vehicles that are classed as motorized, mainly for proper display on BFT (will otherwised be displayed as tanks)
    medicalVehArray = ["rhsusf_m113_usarmy_medical"];   //All medical vehicles, mainly for proper display on BFT (will otherwise be displayed as their vehicle type, i.e. car)

    //Variables
    bftRefresh = 10;  //Refresh rate for blue force tracking (in seconds)
    fobLimit = 5;   //Max number of FOB trucks active
    radarRange = 6000;  //Max range of radars, after this distance radars won't check for targets (currently ignored, might be added back)

    //View distance settings
    CHVD_allowNoGrass = false; // Set 'false' if you want to disable "Low" option for terrain (default: true)
    CHVD_maxView = 12000; // Set maximum view distance (default: 12000)
    CHVD_maxObj = 12000; // Set maximimum object view distance (default: 12000)

    //////DO NOT EDIT//////

    //Create marker used by position generation
    "mrk_area" setMarkerPos [worldSize/2, worldSize/2];
    "mrk_area" setMarkerSize [worldSize/2, worldSize/2];
    "mrk_area" setMarkerAlpha 0;

    //Vars needed by scripts
    bftMarkers = [];
    jetTargets = [];
    heliTargets = [];
    activeTasks = [];   //Not being used
    fobTrucks = [];
    vehArray = [];
    readyArray = [];
    buildObjects = [];
    radars = nearestObjects [getMarkerPos "mrk_area", ["Land_Radar_F", "Land_Radar_Small_F"], worldSize*2.0^0.5];
    radiotowers = nearestObjects [getMarkerPos "mrk_area", ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F"], worldSize*2.0^0.5];
    jetActive = false;
    jetReady = true;

    //vars for AI commander
    orderArray = [];
    requestArray = [];

    //Init caching vars
    JOC_pauseCache = false;
    unitArray = [];
    vehicleArray = [];
    currentGroupId = 0;
    currentUnitId = 0;
    currentVehicleId = 0;

    //Most important arrays
    strategicArray = [];
    orderArray = [];
    requestArray = [];
    assignedArray = [];
    currentRequestID = 0;

    //Get a list of all objects placed in editor
    objectsStart = nearestObjects [[worldSize/2, worldSize/2], ["all"], (worldSize*2^0.5)];

    //Load the mission
    [] call JOC_loadMission;

    //Public var for local scripts
    publicVariable "leaderArray";
    publicVariable "logisticsArray";
    publicVariable "logisticsVehArray";
    publicVariable "editorObjects";
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

    //End loading screen
    [[], {
        endLoadingScreen;
        JOC_serverLoaded = true;
        if (!isServer) then {
            waitUntil{!isNil{JOC_playerInit}};
            [] spawn JOC_playerInit;
        };
    }] remoteExec ["BIS_fnc_spawn", 0, true];

    [] call JOC_initPlayerBase;
    [] call JOC_initDepot;


    //Using CBA EH should be faster than using spawn (plz don't hate me)
    [{
        if (!isNil {HC1}) then {
            {[] call JOC_aiManager;} remoteExecCall ["bis_fnc_call", HC1]; 
        } else {
            {[] call JOC_aiManager;} remoteExecCall ["bis_fnc_call", 2]; 
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
    [JOC_perfLoop, 60, []] call CBA_fnc_addPerFrameHandler;
    [JOC_saveMission, 300, []] call CBA_fnc_addPerFrameHandler;
    [JOC_cmdMiscRadar, 10, []] call CBA_fnc_addPerFrameHandler;
    [JOC_vehRespawn, 60, []] call CBA_fnc_addPerFrameHandler;
    [JOC_cmdCmdLoop, 30, []] call CBA_fnc_addPerFrameHandler;
    //[JOC_bftManager, bftRefresh, []] call CBA_fnc_addPerFrameHandler;
    {
        _marker = _x select 3;
        _marker setMarkerAlpha 0;
    } forEach strategicArray;
} call CBA_fnc_directCall;

[] call JOC_vehRespawn;

/////////////////////////
//Script made by Jochem//
/////////////////////////
//Parameters *FREE TO EDIT*
//Classnames
infantryPool = ["rhs_vdv_rifleman","rhs_vdv_efreitor","rhs_vdv_engineer","rhs_vdv_grenadier","rhs_vdv_at","rhs_vdv_strelok_rpg_assist","rhs_vdv_junior_sergeant","rhs_vdv_machinegunner","rhs_vdv_machinegunner_assistant","rhs_vdv_marksman","rhs_vdv_medic","rhs_vdv_officer","rhs_vdv_officer_armored","rhs_vdv_LAT","rhs_vdv_RShG2","rhs_vdv_sergeant"];    //infantry classnames
sfPool       = [];
carPool      = ["rhs_tigr_m_vdv","rhs_tigr_sts_vdv","rhs_tigr_vdv"];        //car classnames
truckPool    = ["RHS_Ural_VDV_01","RHS_Ural_Open_VDV_01"];        //truck classnames
apcPool      = ["rhs_btr80a_vdv","rhs_btr80_vdv"];       //apc classnames
ifvPool      = ["rhs_bmd4ma_vdv","rhs_bmd4_vdv","rhs_bmd2m","rhs_bmd1r"];       //ifv classnames
tankPool     = ["rhs_t90a_tv","rhs_t80ue1"];       //tank classnames
supportPool  = ["RHS_Ural_Fuel_VDV_01","rhs_gaz66_ammo_vdv"];     //support classnames
airPool      = ["RHS_Mi8AMT_vdv","RHS_Mi8mt_Cargo_vdv","RHS_Mi8MTV3_vdv"];     //transport helicopter classnames
casPool      = ["RHS_Mi24V_vdv","RHS_Ka52_vvs"];      //cas helicopters classnames
jetPoolAG    = ["RHS_Su25SM_KH29_vvs"];       //jet classnames (anti-ground)
jetPoolAA    = ["RHS_T50_vvs_blueonblue"];       //jet classnames (anti-air)
crewClass    = "rhs_vdv_combatcrew";    //Crewman classname
pilotClass   = "rhs_pilot";   //Pilot classname
artyClass    = "rhs_2s3_tv";
aaClass      = "rhs_zsu234_aa";
//Markers
blackTowns = ["Sagonisi"];  //Blacklist towns
blackMarkers = ["mrk_safeZone"];
airfieldMarkers = ["mrk_airfield_0","mrk_airfield_1","mrk_airfield_2","mrk_airfield_3"];   //Markers for airfields

"mrk_area" setMarkerPos [worldSize/2,worldSize/2];
"mrk_area" setMarkerSize [worldSize/2,worldSize/2];
"mrk_area" setMarkerAlpha 0;

//Objects
leaderArray = ["cmd1","cmd2","a0_1","b0_1","c0_1","h1","r1","anv1","s1","v1","rip1"]; //All leading elements
arsenalBoxes = [arsenal1,arsenal2,arsenal3];    //All pre-placed boxes that need to be a virtual arsenal
logisticsArray = ["l1","l2","l3","l4"]; //All units that will be able to use the building crate
logisticsVehArray = ["B_APC_Tracked_01_CRV_F"]; //All vehicles that can tow
motorizedArray = [];    //All vehicles that are classed as motorized
medicalVehArray = [];   //All medical vehicles

//Variables
bftEnable = true;  //Enable blu force tracking
bftRefresh = 0.3;  //Refresh rate for blu force tracking
fobLimit = 5;   //Max number of FOB's
radarRange = 6000;  //Max range of radars

//Init variables *DONT CHANGE*
strategicArray = [];
jetTargets = [];
heliTargets = [];
activeTasks = [];
fobTrucks = [];
baseObjects = nearestObjects [(getMarkerPos "mrk_safeZone"), ["All"], 1200];
jetActive = false;

//Script vars
CHVD_allowNoGrass = false; // Set 'false' if you want to disable "Low" option for terrain (default: true)
CHVD_maxView = 12000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 12000; // Set maximimum object view distance (default: 12000)

//Public var for local scripts
publicVariable "logisticsArray";
publicVariable "baseObjects";
publicVariable "fobTrucks";
publicVariable "airfieldMarkers";
publicVariable "arsenalBoxes";

//Init caching vars
JOC_pauseCache = false;
cacheGroup = createGroup east;
[cacheGroupLeader] joinSilent cacheGroup;
cacheGroup selectLeader cacheGroupLeader;
publicVariable "cacheGroupLeader";
cachedArray = [];
virtualizedArray = [];

//Run init scripts
//[]call JOC_cmdCreateLocations;

[[],{
    progressLoadingScreen 0.3;
}] remoteExec ["BIS_fnc_spawn", 0, true];
//[]call JOC_cmdCreateEnemy;

//End loading screen
[[],{
    endLoadingScreen;
    JOC_serverLoaded = true;
    if(!isServer)then{
        []spawn JOC_clientInit;
    };
}] remoteExec ["BIS_fnc_spawn", 0, true];;

[]spawn JOC_aiManager;
if(bftEnable)then{
    []spawn JOC_bftManager;
};
[]spawn JOC_perfLoop;
[]call JOC_initPlayerBase;
[]call JOC_initDepot;

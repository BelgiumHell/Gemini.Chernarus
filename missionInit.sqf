/////////////////////////
//Script made by Jochem//
/////////////////////////

//Parameters *FREE TO EDIT*
townCount   = 26;   //Number of towns to occupy
baseCount   = 10;   //Number of military structures to occupy
aaCount     = 8;    //Number of AA Emplacements (AA-tank only)
roadCount   = 20;   //Number of roadblocks
patrolCount = 25;   //Number of patrolling vehicles
depotCount  = 5;    //Number of depots
mineCount   = 30;   //Number of minefields
artyCount 	= 4;	//Number of artillery batteries
radioCount 	= 4; 	//Number of radio towers
officerCount = 5;	//Number of officers
fobLimit 	= 5;	//Limitamount of fobs at the same time
//Classnames
infantryPool = ["rhs_vdv_rifleman","rhs_vdv_efreitor","rhs_vdv_engineer","rhs_vdv_grenadier","rhs_vdv_at","rhs_vdv_strelok_rpg_assist","rhs_vdv_junior_sergeant","rhs_vdv_machinegunner","rhs_vdv_machinegunner_assistant","rhs_vdv_marksman","rhs_vdv_medic","rhs_vdv_LAT","rhs_vdv_RShG2","rhs_vdv_sergeant"];    //infantry classnames
sfPool       = [];
carPool      = ["rhs_tigr_msv","rhs_tigr_msv","rhs_uaz_open_MSV_01"];        //car classnames
truckPool    = ["RHS_Ural_MSV_01","RHS_Ural_Open_MSV_01"];        //truck classnames
apcPool      = ["rhs_btr80_msv","rhs_btr80a_msv"];       //apc classnames
ifvPool      = ["rhs_brm1k_tv","rhs_bmp2k_tv","rhs_bmp2_tv","rhs_bmp1k_tv","rhs_prp3_tv"];       //ifv classnames
tankPool     = ["rhs_t80um","rhs_t90_tv"];       //tank classnames
supportPool  = ["rhs_gaz66_ammo_msv","rhs_gaz66_r142_msv","RHS_Ural_Fuel_MSV_01","rhs_gaz66_repair_msv"];     //support classnames
airPool      = ["RHS_Mi8AMTSh_UPK23_vvsc","RHS_Mi8mt_vvsc","RHS_Mi8MTV3_vvsc"];     //transport helicopter classnames
casPool      = ["RHS_Ka52_UPK23_vvsc","RHS_Mi24P_CAS_vvsc"];      //cas helicopters classnames
jetPool      = ["O_Plane_CAS_02_F"];       //jet classnames
//Markers
capitalName = "Chernogorsk";	//Name of capital
blackTowns      = [];  //Blacklist towns
blackMarkers = ["mrk_safeZone"];
airfieldMarkers = ["mrk_airfield_0","mrk_airfield_1","mrk_airfield_2"];   //Markers for airfields
"mrk_area" setMarkerAlpha 0;
"mrk_aaZone_0" setMarkerAlpha 0;
"mrk_aaZone_1" setMarkerAlpha 0;
"mrk_aaZone_2" setMarkerAlpha 0;
"mrk_aaZone_3" setMarkerAlpha 0;
//Objects
leaderArray = [cmd1,cmd2,a1,b1,c1,h1,r1,anv1,s1,v1,rip1];
logisticsArray = ["l1","l2","l3","l4"];
logisticsVehArray = ["B_APC_Tracked_01_CRV_F"];
motorizedArray = ["rhsusf_m113_usarmy","RHS_M2A3_BUSKIII_wd","RHS_M6_wd"];
medicalVehArray = ["RHS_UH60M_MEV"];
jetArray = [];

//Init variables *DONT CHANGE*
opTowns = [];
opTownsN = [];
bluTowns = [];
bluTownsN = [];
indTowns = [];
indTownsN = [];
opTownMarkers = [];
activeTasks = [];
airfieldOccup = [false,false,false];
capitalOccup = [false];
jetActive = false;
jetTargets = [];
groups = [];
groundArray = [];
officerArray = [];
fobTrucks = [];

//Script vars
RydFFE_Interval = 300;	//Sets interval between possible arty calls (I hope so atleast, I didn't make the addon)
CHVD_allowNoGrass = false; // Set 'false' if you want to disable "Low" option for terrain (default: true)
CHVD_maxView = 12000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 12000; // Set maximimum object view distance (default: 12000)

//Public var for local scripts
publicVariable "logisticsArray";
publicVariable "tankMultiplier";

//Run init scripts
//spawn -needs a seperate thread to work
[]spawn JOC_fobManager;
[]spawn JOC_bftManager;
//[] spawn JOC_taskManager;
[]spawn JOC_cacheInit;	//Dunno why I can't use a call for this
[]spawn JOC_cmdManager;
[]spawn JOC_perfLoop;

//call -doesn't need a seperate thread
[]call JOC_initTowns;
[]call JOC_initAirfields;
//[]call JOC_initBases; -not implemented
[]call JOC_initAA;
[]call JOC_initArty;	//Uses AA
[]call JOC_initRadio;	//Uses AA
[]call JOC_initPatrols;
[]call JOC_initMines;

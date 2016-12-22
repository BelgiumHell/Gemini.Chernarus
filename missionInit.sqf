/////////////////////////
//Script made by Jochem//
/////////////////////////

//Note to user:
//This is the only file in the mission meant to be edited, also the only one containing good commenting on variables.
//Do not edit below 'do not edit' mark or an other file in this mission without knowledge of ArmA SQF scripting.

//Parameters *FREE TO EDIT*
//Classnames
infantryPool = ["rhs_vdv_rifleman","rhs_vdv_efreitor","rhs_vdv_engineer","rhs_vdv_grenadier","rhs_vdv_at","rhs_vdv_aa","rhs_vdv_strelok_rpg_assist","rhs_vdv_junior_sergeant","rhs_vdv_machinegunner","rhs_vdv_machinegunner_assistant","rhs_vdv_marksman","rhs_vdv_medic","rhs_vdv_LAT","rhs_vdv_RShG2","rhs_vdv_sergeant"];    //infantry classnames
sfPool       = ["rhs_vdv_recon_marksman_vss","rhs_vdv_recon_marksman_asval","rhs_vdv_recon_grenadier_scout","rhs_vdv_recon_rifleman_scout","rhs_vdv_recon_rifleman_scout_akm"]; //Special forces classnames (#getRekt)
staticPoolAA = ["RHS_ZU23_VDV"];
staticPoolMG = [];
carPool      = ["rhs_tigr_m_vdv","rhs_tigr_sts_vdv","rhs_tigr_vdv"];        //car classnames
truckPool    = ["RHS_Ural_VDV_01","RHS_Ural_Open_VDV_01"];        //truck classnames
apcPool      = ["rhs_btr80a_vdv","rhs_btr80_vdv"];       //apc classnames
ifvPool      = ["rhs_bmd4ma_vdv","rhs_bmd4_vdv","rhs_bmp2k_vdv"];       //ifv classnames
tankPool     = ["rhs_t90a_tv","rhs_t80ue1"];       //tank classnames
supportPool  = ["RHS_Ural_Fuel_VDV_01","rhs_gaz66_ammo_vdv"];     //support classnames
airPool      = ["RHS_Mi8AMT_vdv","RHS_Mi8mt_Cargo_vdv","RHS_Mi8MTV3_vdv"];     //transport helicopter classnames
casPool      = ["RHS_Mi24V_vdv","RHS_Ka52_vvs"];      //cas helicopters classnames
jetPoolAG    = ["RHS_Su25SM_KH29_vvs"];       //jet classnames (anti-ground)
jetPoolAA    = ["RHS_T50_vvs_blueonblue"];       //jet classnames (anti-air)
crewClass    = "rhs_vdv_combatcrew";    //Crewman classname
pilotClass   = "rhs_pilot";   //Pilot classname
officerClass = ""; //Officer classname
artyClass    = "rhs_2s3_tv";    //Arty classname
aaClass      = "rhs_zsu234_aa"; //AA classname
fobClass     = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy"; //Fob classname
emptyClass   = "Land_Airport_center_F";  //Large object, don't change or delete
roofPool     = ["Land_Offices_01_V1_F","Land_WIP_F"];

//Markers
blackTowns = ["Sagonisi"];  //Blacklist towns to not get any strategic value
blackMarkers = ["mrk_safeZone"];    //Markers enemies will not spawn in nor patrol
airfieldMarkers = ["mrk_airfield_0","mrk_airfield_1","mrk_airfield_2","mrk_airfield_3"];   //Markers for airfields

//Objects
leaderArray = []; //All leading elements, this is also used for chain of command
arsenalBoxes = [arsenal1,arsenal2];    //All pre-placed boxes that need to be a virtual arsenal
logisticsArray = ["l1","l2","l3","l4"]; //All units that will be able to use the building crate
logisticsVehArray = ["B_APC_Tracked_01_CRV_F"]; //All vehicles that can tow (might be broken atm, do not expect this to work properly)
motorizedArray = [];    //All vehicles that are classed as motorized, mainly for proper display on BFT (will otherwised be displayed as tanks)
medicalVehArray = [];   //All medical vehicles, mainly for proper display on BFT (will otherwise be displayed as their vehicle type, i.e. car)

//Variables
bftRefresh = 1;  //Refresh rate for blue force tracking (in seconds)
fobLimit = 5;   //Max number of FOB trucks active
radarRange = 6000;  //Max range of radars, after this distance radars won't chack for targets (currently ignored, might be added back)
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

//vars for AI commander
orderArray = [];
requestArray = [];

//Init caching vars
JOC_pauseCache = false;
unitArray = [];
unitArrayChanged = [];
vehicleArray = [];
vehicleArrayChanged = [];
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
objectsStart = nearestObjects [[worldSize/2,worldSize/2], ["all"], (worldSize*2^0.5)];
{
    _x enableSimulationGlobal false;
} forEach objectsStart;

//Read database
saveCount = 0;
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
    _index = 0;

    //Get strategic array
    //Get virtualized array
    while{typeName (["read", ["main", format["strategicArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        strategicArray pushBack (["read", ["main", format["strategicArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    {
        _array = (_x select 3);
        _name = (_array select 0);
        _marker = createMarker [_name, (_array select 1)];
        _name setMarkerShape (_array select 2);
        _name setMarkerSize (_array select 3);
        _name setMarkerBrush (_array select 4);
        _name setMarkerColor (_array select 5);
        _x set [3,_name];
    } forEach strategicArray;
    strategicCount = count strategicArray;

    //unitArray
    _index = 0;
    while{typeName (["read", ["main", format["unitArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        _array = (["read", ["main", format["unitArray_%1",_index]]] call _inidbi);
        _array set[5,call (compile (_array select 5))];
        _array set[8,call (compile (_array select 8))];
        unitArray pushBack _array;
        _index = _index + 1;
    };

    //vehicleArray
    _index = 0;
    while{typeName (["read", ["main", format["vehicleArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        _array = (["read", ["main", format["vehicleArray_%1",_index]]] call _inidbi);
        _array set[3,call (compile (_array select 3))];
        vehicleArray pushBack _array;
        _index = _index + 1;
    };

    //Orderarray
    _index = 0;
    while{typeName (["read", ["main", format["orderArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        orderArray pushBack (["read", ["main", format["orderArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //RequestArray
    _index = 0;
    while{typeName (["read", ["main", format["requestArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        requestArray pushBack (["read", ["main", format["requestArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //assignedArray
    _index = 0;
    while{typeName (["read", ["main", format["assignedArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        assignedArray pushBack (["read", ["main", format["assignedArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //Object damage
    _damageValues = [];
    _index = 0;
    while{typeName (["read", ["main", format["damageValues_%1",_index],"0"]] call _inidbi) != typeName "0"}do{
        _damageValues append (["read", ["main", format["damageValues_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };
    {
        if(!isNil{(_damageValues select _forEachIndex)})then{
            _x setDamage (_damageValues select _forEachIndex);
        };
    } forEach objectsStart;

    //buildObjects
    _index = 0;
    while{typeName (["read", ["main", format["buildObjects_%1",_index],0]] call _inidbi) != typeName 0}do{
        buildObjects pushBack (["read", ["main", format["buildObjects_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //Objects spawned on mission load
    _objectsAdded = [];
    _index = 0;
    while{typeName (["read", ["header", format["objectsAdded_%1",_index],0]] call _inidbi) != typeName 0}do{
        _objectsAdded pushBack (["read", ["header", format["objectsAdded_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };
    {
        _object = (_x select 0) createVehicle (_x select 1);
        _object setPosASL (_x select 1);
        _object setDir (_x select 2);
    } forEach _objectsAdded;

    //Buildobjects
    _buildAdded = [];
    _index = 0;
    while{typeName (["read", ["header", format["buildObjects_%1",_index],0]] call _inidbi) != typeName 0}do{
        _buildAdded pushBack (["read", ["header", format["buildObjects_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };
    {
        _object = (_x select 0) createVehicle (_x select 1);
        _object setPosASL (_x select 1);
        _object setDir (_x select 2);
    } forEach _buildAdded;

    //get fobs and deploy them if applicable
    _fobArray = ["read", ["main", "fobArray",[]]] call _inidbi;
    {
        _truck = fobClass createVehicle (_x select 0);
        _truck setPosASL (_x select 0);
        _truck setDir (_x select 1);
        [_truck]call JOC_fobInit;
        fobTrucks pushBack _truck;

        if(_x select 2)then{
            [_truck]call JOC_fobDeploy;
        };
    } forEach _fobArray;

    currentUnitId = ["read", ["main", "currentUnitID", -1]] call _inidbi;
    currentVehicleId = ["read", ["main", "currentVehicleID", -1]] call _inidbi;
    currentGroupID = ["read", ["main", "currentGroupID", -1]] call _inidbi;
    currentRequestID = ["read", ["main", "currentRequestID", -1]] call _inidbi;
    jetActive = ["read", ["main", "jetActive", false]] call _inidbi;
    jetReady = ["read", ["main", "jetReady", false]] call _inidbi;
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
};

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
[JOC_perfLoop, 60, []]call CBA_fnc_addPerFrameHandler;
[JOC_saveMission, 300, []]call CBA_fnc_addPerFrameHandler;
[JOC_cmdMiscRadar, 10, []]call CBA_fnc_addPerFrameHandler;
[JOC_vehRespawn, 3600, []]call CBA_fnc_addPerFrameHandler;
[JOC_cmdCmdLoop, 30, []]call CBA_fnc_addPerFrameHandler;
//[JOC_bftManager, bftRefresh, []] call CBA_fnc_addPerFrameHandler;
{
    _marker = _x select 3;
    _marker setMarkerAlpha 0;
} forEach strategicArray;

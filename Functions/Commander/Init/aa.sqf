/////////////////////////
//Script made by Jochem//
/////////////////////////
_tankBlacklist = [];

//"Activate" radars
/*
{
	_location = getPos _x;

	_nameS = format ["mrk_strategic_radar_%1",_forEachIndex];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [300,300];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,500,"radar",_nameS,1];
} forEach radars;*/

//Place AA-tanks
_aaComp = [
	["Land_HBarrier_5_F",[3.479,0.705566,0],90,1,0,[],"","",true,false], 
	["Land_HBarrier_3_F",[1.45459,-3.61816,0],0,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-6.42773,1.92358,0],0,1,0,[],"","",true,false], 
	["Land_TentA_F",[-4.67969,-1.41309,0],270,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[3.47998,6.4126,0],90,1,0,[],"","",true,false], 
	["Land_TentA_F",[-4.69775,-3.00879,0],270,1,0,[],"","",true,false], 
	["Land_BagBunker_Tower_F",[-4.29297,-3.60132,-0.00190163],0,1,0,[],"","",true,false], 
	["rhs_Igla_AA_pod_vdv",[-3.95801,-1.88062,-0.100008],359.994,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-6.28271,6.27148,0],90,1,0,[],"","",true,false], 
	["Land_HBarrier_3_F",[-0.633789,-7.50073,0],0,1,0,[],"","",true,false], 
	["rhs_weapon_crate",[-5.49316,-5.4126,-9.53674e-007],269.998,1,0.0262999,[],"","",true,false], 
	["rhs_zsu234_aa",[-0.968262,7.53052,-0.0460162],0.00134093,1,0,[],"","",true,false], 
	["rhs_KORD_high_VDV",[-5.12646,-5.83154,-0.105784],179.977,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[3.45703,12.0876,0],90,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-6.30566,11.9465,0],90,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-0.879395,13.3147,0],0,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-6.48633,13.3132,0],0,1,0,[],"","",true,false]
];
_tank = 0;
_location = [];
_group = createGroup east;
_group setVariable["JOC_caching_disabled", true, true];

while {_tank < 24} do{
	_location = ["mrk_area",0,[_tankBlacklist + blackMarkers + airfieldMarkers,[],[]],1,[3,75],[0,360],[1,0,35],[0,0,0],[1,100],[1,10,15],[1,[0,0,-1],35]]call Zen_FindGroundPosition;

	_objects = [_location,random 360,_aaComp]call BIS_fnc_ObjectsMapper;

	{
        _obj = _x;

        createVehicleCrew _obj;
        (crew _obj) joinSilent _group;
        _obj setFuel 0;
        _obj setSkill 1;
    }forEach _objects;

	_nameS = format ["mrk_strategic_aa_%1",_tank];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,100,"aa",_nameS,1];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [2000,2000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerAlpha 0;
	_tankBlacklist pushBack _nameM;

	_tank = _tank + 1;
};

{
    deleteMarker _x;
} forEach _tankBlacklist;

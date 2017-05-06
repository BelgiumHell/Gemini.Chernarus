/////////////////////////
//Script made by Jochem//
/////////////////////////
_tankBlacklist = [];

//"Activate" radars
/*
{
	_location = getPos _x;

	_nameS = format ["mrk_strategic_radar_%1",_forEachIndex];
	_marker = createMarker [_nameS,_location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [300,300];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,500,"radar",_nameS,1];
} forEach radars;*/

//Place AA-tanks
_aaComp = [
	["Land_HBarrier_5_F",[-5.47656,1.81201,0],0,1,0,[0,0],"","",true,false],
	["Land_BagFence_Corner_F",[-1.71533,-0.626221,2.75],0,1,0,[0,0],"","",true,false],
	["Land_TentA_F",[-3.72852,-1.52466,0],270,1,0,[0,0],"","",true,false],
	["Land_BagFence_Short_F",[-1.71045,-2.18335,2.75],90,1,0,[0,-0],"","",true,false],
	["Land_BagFence_Short_F",[-3.36523,-0.625977,2.75],0,1,0,[0,0],"","",true,false],
	["Land_HBarrier_5_F",[4.43018,0.593994,0],90,1,0,[0,-0],"","",true,false],
	["Land_TentA_F",[-3.74658,-3.12036,0],270,1,0,[0,0],"","",true,false],
	["Land_HBarrier_3_F",[2.40576,-3.72974,0],0,1,0,[0,0],"","",true,false],
	["Land_BagBunker_Tower_F",[-3.3418,-3.71289,-0.00190163],0,1,0,[0,0],"","",true,false],
	["rhs_Igla_AA_pod_vdv",[-3.00684,-1.99243,2.75],359.998,1,0,[-0.000417155,0.00129716],"","",true,false],
	["Land_BagFence_Corner_F",[-4.87695,-0.570313,2.75],270,1,0,[0,0],"","",true,false],
	["Land_HBarrier_5_F",[4.43115,6.30103,0],90,1,0,[0,-0],"","",true,false],
	["Land_BagFence_Short_F",[-4.9502,-2.43188,2.75],90,1,0,[0,-0],"","",true,false],
	["Land_HBarrier_5_F",[-5.33154,6.15991,0],90,1,0,[0,-0],"","",true,false],
	["rhs_weapon_crate",[-4.54199,-5.52417,3.8147e-006],269.998,1,0.00877635,[0.00222836,0.000684464],"","",true,false],
	[aaClass,[-0.0166016,7.41821,-0.0452938],3.40559e-005,1,0,[-0.0155337,-0.110973],"","",true,false],
	["Land_HBarrier_3_F",[0.317383,-7.6123,0],0,1,0,[0,0],"","",true,false],
	["rhs_KORD_high_VDV",[-4.17578,-5.94312,2.75],179.996,1,0,[0.0756089,0.129799],"","",true,false],
	["Land_HBarrier_5_F",[4.4082,11.9761,0],90,1,0,[0,-0],"","",true,false],
	["Land_HBarrier_5_F",[-5.35449,11.835,0],90,1,0,[0,-0],"","",true,false],
	["Land_HBarrier_5_F",[0.0717773,13.2031,0],0,1,0,[0,0],"","",true,false],
	["Land_HBarrier_5_F",[-5.53516,13.2017,0],0,1,0,[0,0],"","",true,false]
];
_tank = 0;
_location = [];
_group = createGroup east;
_group setVariable["JOC_caching_disabled",true,true];

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
	_marker = createMarker [_nameS,_location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,100,"aa",_nameS,1,2];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM,_location];
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

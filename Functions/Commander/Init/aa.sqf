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
	["Land_HBarrier_5_F",[3.06836,2.20313,0],90,1,0,[0,-0],"","",true,false],
	["Land_HBarrier_3_F",[0.968262,-3.6167,0],0,1,0,[0,0],"","",true,false],
	["rhs_Igla_AA_pod_vdv",[-4.36865,-0.383301,2.8],359.998,1,0,[-0.000430414,0.00128648],"","",true,false],
	["Land_TentA_F",[-5.09033,0.0844727,0],270,1,0,[0,0],"","",true,false],
	["Land_BagBunker_Tower_F",[-4.70361,-2.10376,-0.00190163],0,1,0,[0,0],"","",true,false],
	["Land_TentA_F",[-5.1084,-1.51123,0],270,1,0,[0,0],"","",true,false],
	["Land_HBarrier_5_F",[-6.83838,3.42114,0],0,1,0,[0,0],"","",true,false],
	["Land_HBarrier_5_F",[3.06934,7.91016,0],90,1,0,[0,-0],"","",true,false],
	["rhs_KORD_high_VDV",[-5.5376,-4.33301,2.8],179.971,1,0,[0.114877,0.114682],"","",true,false],
	["Land_HBarrier_5_F",[-6.69336,7.76904,0],90,1,0,[0,-0],"","",true,false],
	["rhs_zsu234_aa",[-1.37842,9.02734,-0.0452938],3.40559e-005,1,0,[-0.0155337,-0.110973],"","",true,false],
	["Land_HBarrier_5_F",[3.04639,13.5852,0],90,1,0,[0,-0],"","",true,false],
	["Land_HBarrier_5_F",[-6.71631,13.4441,0],90,1,0,[0,-0],"","",true,false],
	["Land_HBarrier_5_F",[-1.29004,14.8123,0],0,1,0,[0,0],"","",true,false],
	["Land_HBarrier_5_F",[-6.89697,14.8108,0],0,1,0,[0,0],"","",true,false]
];
_tank = 0;
_location = [];

while {_tank < 24} do{
	_location = ["mrk_area",0,[_tankBlacklist + blackMarkers + airfieldMarkers,[],[]],1,0,[0,360],[1,0,35],[0,0,0],[1,100],[1,10,15],[1,[0,0,-1],35]]call Zen_FindGroundPosition;

	_objects = [_location,random 360,_aaComp]call BIS_fnc_ObjectsMapper;
	_group = createGroup east;

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

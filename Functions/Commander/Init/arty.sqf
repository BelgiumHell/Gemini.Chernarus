/////////////////////////
//Script made by Jochem//
/////////////////////////
_artyGroup = createGroup east;
_artyGroup setVariable["JOC_caching_disabled",true ,true];
[_artyGroup]call JOC_setGroupID;
_tankBlacklist = [];
_artyComp = [
	["RHS_ZU23_VDV",[0.252441,0.818115,-0.12567],0,1,0,[0.0426026,-0.00463006],"","",true,false],
	["Land_BagFence_Short_F",[-1.43555,-1.11475,-0.000999928],45,1,0,[0,0],"","",true,false],
	["Land_BagFence_Round_F",[0.398438,-2.40845,-0.00130129],0,1,0,[0,0],"","",true,false],
	["Land_BagFence_Round_F",[-2.70557,0.848633,-0.00130129],90,1,0,[0,-0],"","",true,false],
	["Land_BagFence_Short_F",[2.39941,-1.22363,-0.000999928],135,1,0,[0,-0],"","",true,false],
	["Land_BagFence_Short_F",[-1.48975,2.6604,-0.000999928],135,1,0,[0,-0],"","",true,false],
	["Land_BagFence_Round_F",[3.77002,0.677246,-0.00130129],270,1,0,[0,0],"","",true,false],
	["Land_BagFence_Short_F",[2.47705,2.56299,-0.000999928],45,1,0,[0,0],"","",true,false],
	["Land_BagFence_Round_F",[0.5,3.96069,-0.00130129],180,1,0,[0,0],"","",true,false],
	["Land_BagBunker_Small_F",[6.94531,-5.71558,0],270,1,0,[0,0],"","",true,false],
	["rhs_KORD_high_VDV",[6.75049,-5.87964,-0.0809221],90,1,0,[0.130883,0.0550158],"","",true,false],
	["Land_HBarrierTower_F",[-2.38965,-8.85669,0],0,1,0,[0,0],"","",true,false],
	["Land_HBarrierWall6_F",[-10.1738,-5.59399,0],270,1,0,[0,0],"","",true,false],
	["rhs_KORD_high_VDV",[-2.45361,-10,2.26],180,1,0,[10.7606,6.28659],"","",true,false],
	["Land_HBarrierWall6_F",[5.78223,-12.2153,0],180,1,0,[0,0],"","",true,false],
	["Land_HBarrierTower_F",[-12.3477,5.15698,0],90,1,0,[0,-0],"","",true,false],
	["Land_HBarrierTower_F",[12.2202,6.55273,0],270,1,0,[0,0],"","",true,false],
	["rhs_2s3_tv",[-1.96191,13.6624,-0.0497031],0,1,0,[0.410539,-0.00342147],"","",true,false],
	["Land_HBarrierWall_corner_F",[-8.49854,-11.1118,0],180,1,0,[0,0],"","",true,false],
	["Land_HBarrierWall_corner_F",[-14.0825,-0.0703125,0],180,1,0,[0,0],"","",true,false],
	["Land_HBarrierWall6_F",[15.6533,0.0756836,0],90,1,0,[0,-0],"","",true,false],
	["rhs_KORD_high_VDV",[-13.5,5.37256,2.26],270,1,0,[0.735671,0.865245],"","",true,false],
	["Land_HBarrierWall_corner_F",[11.4741,-10.6375,0],90,1,0,[0,-0],"","",true,false],
	["rhs_KORD_high_VDV",[13.3,6.83789,2.26],90,1,0,[12.5229,-4.18807],"","",true,false],
	["Land_HBarrierWall_corridor_F",[15.0449,-5.66943,0],0,1,0,[0,0],"","",true,false],
	["rhs_2s3_tv",[-8.6665,13.6624,-0.0497031],0,1,0,[0.410539,-0.00342147],"","",true,false],
	["Land_HBarrierWall6_F",[-15.6904,12.2119,0],270,1,0,[0,0],"","",true,false],
	["Land_HBarrierTower_F",[7.7085,18.0156,0],180,1,0,[0,0],"","",true,false],
	["Land_HBarrierWall6_F",[-0.48584,21.3452,0],0,1,0,[0,0],"","",true,false],
	["Land_HBarrierWall6_F",[15.561,14.6404,0],90,1,0,[0,-0],"","",true,false],
	["rhs_KORD_high_VDV",[7.95068,19,2.26],0,1,0,[7.00475,-0.224557],"","",true,false],
	["Land_HBarrierWall6_F",[-8.98291,21.3491,0],0,1,0,[0,0],"","",true,false],
	["Land_HBarrierWall_corner_F",[-14.5635,19.6301,0],270,1,0,[0,0],"","",true,false],
    ["Land_HBarrierWall_corner_F",[13.9624,20.2239,0],0,1,0,[0,0],"","",true,false]
];

_s = 0;
while{_s < 4}do{
	//Get position
	_location = ["mrk_area",0,[_tankBlacklist + blackMarkers + airfieldMarkers,[],[]],1,[3,75],[0,360],[1,0,35],[0,0,0],[1,100],[1,10,15],[1,[0,0,-1],35]] call Zen_FindGroundPosition;

	_objects = [_location,0,_artyComp]call BIS_fnc_ObjectsMapper;
	_group = createGroup east;

	{
        _obj = _x;

        createVehicleCrew _obj;
        if(typeOf _obj == artyClass)then{
            (crew _obj) joinSilent _artyGroup;
        }else{
            (crew _obj) joinSilent _group;
        };
        _obj setFuel 0;
        _obj setSkill 1;
    }forEach _objects;

	_nameS = format ["mrk_strategic_arty_%1",_s];
	_marker = createMarker [_nameS,_location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,60,"arty",_nameS,1,2];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM,_location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [6000,6000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerAlpha 0;
	_tankBlacklist pushBack _nameM;

   	_s = _s + 1;
};

{
    deleteMarker _x;
} forEach _tankBlacklist;

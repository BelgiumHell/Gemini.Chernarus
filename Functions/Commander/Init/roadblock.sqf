/////////////////////////
//Script made by Jochem//
/////////////////////////
_roadblockComp = [["Land_BagBunker_Tower_F",[7.75586,0.830078,0.108016],180.543],["Land_BagBunker_Tower_F",[-7.99805,-1.03906,0.00931168],1.52979],["Land_CncBarrier_F",[1.89844,8.77148,0.0091486],180.1],["Land_CncBarrier_F",[-1.95508,-9.08594,0.0114155],359.113],["Land_CncBarrier_F",[-8.49023,5.44922,0.00723648],180.401],["Land_CncBarrier_F",[4.38867,9.65039,0.00916862],180.318],["Land_CncBarrier_F",[8.36914,-5.58984,0.0210438],359.414],["RoadBarrier_F",[1.46289,10.8184,0.00545216],176.246],["Land_CncBarrier_F",[-4.42969,-10.0078,0.0113583],359.331],["Land_CncBarrier_F",[8.47266,7.67773,0.00911617],272.335],["RoadBarrier_F",[-9.33203,7.13281,0.0053091],183.452],["RoadBarrier_F",[-1.45898,-11.084,0.00580311],355.371],["Land_CncBarrier_F",[6.86914,9.51172,0.00916958],224.321],["Land_CncBarrier_F",[-10.9766,4.5625,0.00690556],180.177],["Land_CncBarrier_F",[-8.55078,-8.10547,0.0110445],91.3484],["Land_CncBarrier_F",[10.8418,-4.66211,0.0241566],359.19],["RoadBarrier_F",[9.26563,-7.21289,0.00541401],2.52625],["Land_CncBarrier_F",[-6.91406,-9.91211,0.00904942],43.3339],["Land_CncBarrier_F",[-12.9688,0.494141,0.00687695],89.8246],["Land_CncBarrier_F",[12.7656,-0.554688,0.0213385],268.838],["Land_CncBarrier_F",[-12.8125,2.9668,0.0090971],137.848],["Land_CncBarrier_F",[12.6504,-3.03125,0.0256138],316.861]];

_roadblock = 0;
while {_roadblock < 40} do{
	_location = ["mrk_area",0,[blackMarkers + airfieldMarkers,[],[]],1,[1,50],[0,360],[1,0,20],[0,0,0],[1,100],[1,10,5],[1,[0,0,0],20]] call Zen_FindGroundPosition;
    _helperObj = "Land_HelipadEmpty_F" createVehicle _location;
	_dir = [_location]call Zen_FindRoadDirection;
	_helperObj setDir _dir;

    {
		_type = _x select 0;
		_offset = _x select 1;
		_newdir = _x select 2;

		_obj = createVehicle [_type,[0,0,0],[],0,"CAN_COLLIDE"];
		_obj allowDamage false;
		[_helperObj,_obj,_offset,_newdir,true,true] call BIS_fnc_relPosObject;

	}forEach _roadblockComp;

    deleteVehicle _helperObj;

	_nameS = format ["mrk_strategic_roadblock_%1",_roadblock];
	_marker = createMarker [_nameS,_location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [50,50];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,10,"roadblock",_nameS,1,2];

	_roadblock = _roadblock + 1;
};

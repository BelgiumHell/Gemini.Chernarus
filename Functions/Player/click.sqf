/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_prevDis","_groupIdG","_group","_position"];

onMapSingleClick{
	_prevDis = 999;
	_groupIdG = "";
	_group = 0;
	_position = _pos;
	_markers = allMapMarkers;
	{
		_distance = ((getMarkerPos _x) distance _position);
		if((_distance < 10) and (_distance < _prevDis))then{
			hint _x;
			_prevDis = _distance;
			_groupIdG = _x;
		};
	}forEach _markers;
	testVv = _groupIdG;
	if(!(_groupIdG == ""))then{
		{
			if((groupId _x) == _groupIdG)then{
				_group = _x;
			};
		}forEach allGroups;
		testG = _group;
		_unitsG = (units _group);
		_unitText = "";
		{
			_unitText = composeText [_unitText, lineBreak, (name _x)];
		}forEach _unitsG;
		_text = parseText format["<t color='#0080FF' size='2'>%1</t>",_groupIdG];
		_text = composeText [_text, lineBreak, _unitText];
		hint _text;
	};
};
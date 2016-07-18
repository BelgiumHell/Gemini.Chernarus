/////////////////////////
//Script made by Jochem//
/////////////////////////
onMapSingleClick{
	if(!(isNull objectParent player) && ("ItemGPS" in (assigneditems player)))exitWith{};
	hint "";
	terminate bftHandle;
	_prevDis = 999;
	_groupIdG = "";
	_group = 0;
	_position = _pos;
	_unitMarkers = [];
	_markers = allMapMarkers;
	{
		_distance = ((getMarkerPos _x) distance _position);
		if((_distance < 70) and (_distance < _prevDis))then{
			_prevDis = _distance;
			_groupIdG = _x;
		};
	}forEach _markers;

	if(!(_groupIdG == ""))then{
		{
			if((groupId _x) == _groupIdG)then{
				_group = _x;
			};
		}forEach allGroups;

		_unitsG = (units _group);
		_unitText = "";
		{
			_veh = vehicle _x;
			if(_veh isKindOf "man")then{
				_vehText = "";
			}else{
				_vehText = format["(%1)",(typeOf _veh)]
			};
			_unitText = composeText [_unitText, lineBreak, (name _x) + ""];
		}forEach _unitsG;
		_text = parseText format["<t color='#0080FF' size='2'>%1</t>",_groupIdG];

		_freq = 0;
		_block = 1;
		{
			_freq = [[]call acre_api_fnc_getCurrentRadio]call acre_api_fnc_getRadioChannel;
		}forEach [(leader _group)];
		if(isNil {_freq})then{
			_freq = "N/A";
			_block = "N/A";
		}else{
			while{_freq > 16}do{
				_block = _block + 1;
				_freq = _freq - 16;
			};
		};

		_freqText = format["Radio freq: block:%1 ch:%2",_block,_freq];
		_text = composeText [_text, lineBreak, _unitText, lineBreak, lineBreak, _freqText];
		hint _text;

		bftHandle = [_unitsG]spawn JOC_bftDrawUnits;
	};
};

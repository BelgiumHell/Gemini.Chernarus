/////////////////////////
//Script made by Jochem//
/////////////////////////
_veh = (vehicle player);
//if(cduEnabled)then{cduEnabled = false};
if(cduEnabled or (player != (commander _veh)))exitWith{cduEnabled = false};
if(!cduEnabled)then{
cduEnabled = true;
while{cduEnabled}do{
	//Ammo
	_magazines = magazinesAmmo _veh;
	_magazinesD = magazinesDetail _veh;
	_magazineNames = [];
	_magazineAmmo = [];
	_magazineStrings = [];

	{
		_name = _x select 0;
		_ammo = _x select 1;
		
		_string = (_magazinesD select _forEachIndex);
		_stringId = _string find "(";
		_stringD = _string select [_stringId];
		_string = [_string,_stringD,""]call Zen_StringFindReplace;
		
		if(!(_name in _magazineNames))then{
			[_magazineNames,count _magazineNames,_name] call Zen_ArrayInsert;
			[_magazineAmmo,count _magazineAmmo,_ammo] call Zen_ArrayInsert;
			[_magazineStrings,count _magazineStrings,_string] call Zen_ArrayInsert;
		}else{
			_id = (_magazineNames find _name);
			_ammoN = ((_magazineAmmo select _id) + _ammo);
			_magazineAmmo set [_id, _ammoN];
		};
	}forEach _magazines;
	
	_ammoText = "";
	{
		_ammoText = composeText [_ammoText, lineBreak, (_magazineStrings select _forEachIndex),"(",(str(_magazineAmmo select _forEachIndex)),")"];
	}forEach _magazineNames;

	//APS
	_statusL = "";
	_statusR = "";
	_statusLO = (_veh getVariable "reloading_left");
	_statusRO = ( _veh getVariable "reloading_right");
	if(_statusLO == 0)then{_statusL = parseText "<t color='#01DF01'>Ready</t>";}else{_statusL = parseText "<t color='#DF0101'>Reloading</t>";};
	if(_statusRO == 0)then{_statusR = parseText "<t color='#01DF01'>Ready</t>";}else{_statusR = parseText "<t color='#DF0101'>Reloading</t>";};
	_aps_leftA = parseText format["APS left(%1)",(_veh getVariable "ammo_left")];
	_aps_rightA = parseText format["APS right(%1)",(_veh getVariable "ammo_right")];
	_apsText = composeText [_aps_leftA, " | Status: ", _statusL, lineBreak, _aps_rightA, " | Status: ", _statusR];
	//Misc
	_miscText = "";

	_text = composeText [_ammoText, lineBreak, "-------------", lineBreak, _apsText, lineBreak, "-------------", _miscText];

	hintSilent _text;
	sleep 0.1;
};
};
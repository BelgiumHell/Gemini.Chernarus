/////////////////////////
//Script made by Jochem//
/////////////////////////
_veh = (vehicle player);
//if (cduEnabled) then {cduEnabled = false};
if (cduEnabled || (player != (commander _veh)) || player == _veh) exitWith {cduEnabled = false};
if (!cduEnabled) then {
	cduEnabled = true;
	while{cduEnabled && (player == (commander _veh))}do{
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
			_string = [_string, _stringD, ""] call Zen_StringFindReplace;

			if (!(_name in _magazineNames)) then {
				_magazineNames pushBack _name;
				_magazineAmmo pushBack _ammo;
				_magazineStrings pushBack _string;
			} else {
				_id = (_magazineNames find _name);
				_ammoN = ((_magazineAmmo select _id) + _ammo);
				_magazineAmmo set [_id, _ammoN];
			};
		} forEach _magazines;

		_ammoText = "";
		{
			_ammoText = composeText [_ammoText, lineBreak, (_magazineStrings select _forEachIndex), "(", (str(_magazineAmmo select _forEachIndex)), ")"];
		} forEach _magazineNames;

		//Misc
		_miscText = "";

		{
		    _miscText = composeText [_miscText, format ["%1: %2(%3)", ((assignedVehicleRole _x) select 0), name _x, (groupId (group _x))], lineBreak];
		} forEach crew _veh;

		_text = composeText [_ammoText, lineBreak, "-------------", _miscText];

		hintSilent _text;
		sleep 0.1;
	};
};

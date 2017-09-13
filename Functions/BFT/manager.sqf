/////////////////////////
//Script made by Jochem//
/////////////////////////
{
	_marker = createMarker [(groupId _x),(getPos (leader _x))];
	bftMarkers pushBack [_marker,_x];
} forEach (allGroups select {
	_group = _x;
	side _group == west && count (bftMarkers select {_x select 1 == _group}) == 0
});

{
	_marker = _x select 0;
	_group = _x select 1;

	_icon = "b_inf";
	_leader = leader _group;
	_units = units _group;

	if ((vehicle _leader) isKindOf "man") then {
		_icon = "b_inf";
	};

	if ((vehicle _leader) isKindOf "LandVehicle" && (effectiveCommander (vehicle _leader)) in _units) then {
		if ((vehicle _leader) isKindOf "car") then {
			_icon = "b_motor_inf";
		};
		if ((vehicle _leader) isKindOf "Truck_F") then {
			_icon = "b_motor_inf";
		};
		if ((vehicle _leader) isKindOf "tank") then {
			_icon = "b_armor";
		};
		if ((typeOf (vehicle _leader)) in motorizedArray) then {
			_icon = "b_mech_inf";
		};
		if ((typeOf (vehicle _leader)) in logisticsVehArray) then {
			_icon = "b_maint";
		};
		if ((typeOf (vehicle _leader)) == "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy") then {
			_icon = "b_support";
		};
	};
	if ((vehicle _leader) isKindOf "Air" && (effectiveCommander (vehicle _leader)) in _units) then {
		_icon = "b_air";
	};
	if ((vehicle _leader) isKindOf "Ship" && (effectiveCommander (vehicle _leader)) in _units) then {
		_icon = "b_naval";
	};
	///////////////////////////////////////////////////
	_x setMarkerType _icon;
	_x setMarkerText (groupId _group);
	_x setMarkerAlpha 0;

	if (isNull _group) then {
		deleteMarker _marker;
	};
} forEach bftMarkers;

[[bftMarkers],{
	params["_bftMarkers"];
    if (!(isNull objectParent player)) then {
		{
		    _x setMarkerAlphaLocal 1;
		} forEach _bftMarkers;
	};
}] remoteExec ["bis_fnc_call",-2]; 

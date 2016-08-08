/////////////////////////
//Script made by Jochem//
/////////////////////////
_bftMarkers = [];
_groups = [];
{
	if(side _x == west)then{
		_groups pushBack _x;
	};
}forEach allGroups;

{
	_id = (groupId _x);
	_leader = (leader _x);
	if(alive _leader)then{
		_icon = "b_inf";
		////////////////////////////////////////////////
		if((count((getMarkerPos _id) - [0,0,0])) > 1)then{
			_id setMarkerPos (getPos _leader);
		}else{
			_marker = createMarker [_id, (getPos _leader)];
		};

		_bftMarkers pushBackUnique _id;

		if((vehicle _leader) isKindOf "man")then{
			_icon = "b_inf";
		};
		if((vehicle _leader) isKindOf "LandVehicle" && (effectiveCommander (vehicle _leader)) in _unitsG)then{
			if((vehicle _leader) isKindOf "car")then{
				_icon = "b_motor_inf";
			};
			if((vehicle _leader) isKindOf "Truck_F")then{
				_icon = "b_motor_inf";
			};
			if((vehicle _leader) isKindOf "tank")then{
				_icon = "b_armor";
			};
			if((typeOf (vehicle _leader)) in motorizedArray)then{
				_icon = "b_mech_inf";
			};
			if((typeOf (vehicle _leader)) in logisticsVehArray)then{
				_icon = "b_maint";
			};
			if((typeOf (vehicle _leader)) == "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy")then{
				_icon = "b_support";
			};
		};
		if((vehicle _leader) isKindOf "Air" && (effectiveCommander (vehicle _leader)) in _unitsG)then{
			_icon = "b_air";
		};
		if((vehicle _leader) isKindOf "Ship" && (effectiveCommander (vehicle _leader)) in _unitsG)then{
			_icon = "b_naval";
		};
		///////////////////////////////////////////////////
		_id setMarkerType _icon;
		_id setMarkerText _id;
		_id setMarkerAlpha 0;
	}else{
		deleteMarker _id;
	};
}forEach _groups;

{
    if(!(isNull objectParent player) && ("ItemGPS" in (assigneditems player)))then{
		{
		    _x setMarkerAlphaLocal 1;
		} forEach _bftMarkers;
	};
} remoteExec ["bis_fnc_call", -2]; 

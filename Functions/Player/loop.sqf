/////////////////////////
//Script made by Jochem//
/////////////////////////
_dummy = objNull;
_vehicle = objNull;
_time = 0;
musicPlay = false;
_radioHandle = scriptNull;

while{true}do{
	//Fix vanilla damage
	player setDamage 0;
	//Pardon TK'ing
	player addRating 2000;

	//Music
	if(musicPlay && (vehicle player) != player && _time < time)then{
        detach _dummy;
        deleteVehicle _dummy;
        _time = time + 57;
        _dummy = "Land_HelipadEmpty_F" createVehicle [0,0,0];
        _dummy attachTo [(vehicle player),[0,0,0]];
        [[_dummy],{
            (_this select 0) say3D "heliSpeakerSound";
        }] remoteExec ["BIS_fnc_spawn", 0, true];
        _vehicle = (vehicle player);
    }else{
        if(!musicPlay || (vehicle player) != _vehicle)then{
            _time = 0;
            detach _dummy;
            deleteVehicle _dummy;
        };
    };

	//RWR
	if(vehicle player in (jetTargets + heliTargets))then{
		playSound ["rwrSound",true];
	};

	//Zeus
	if(!isNull curatorCamera)then{
		_curator = (getAssignedCuratorLogic player);
		[[_curator],{
			_curator = _this select 0;
			_curator addCuratorEditableObjects [(allUnits - [cacheGroupLeader]),false];
			_curator addCuratorEditableObjects [allDead,false];
			_curator addCuratorEditableObjects [vehicles - editorObjects,false];
		}] remoteExec ["BIS_fnc_spawn", 2];

	};

	//Radio jamming (experimental)
	if((count (nearestObjects [player, ["Land_TTowerBig_1_F","Land_TTowerBig_2_F"], 2000])) >= 1)then{
		_radioHandle = []spawn{
			while{true}do{
				_radios = [] call acre_api_fnc_getCurrentRadioList;
				//acre_sys_core_keyedMicRadios = (playableUnits + switchableUnits);
				{
				    [_x, round (random 14)] call acre_api_fnc_setRadioChannel;
				} forEach _radios;
				sleep 0.3;
			};
		};
	}else{
		terminate _radioHandle;
	};
	sleep 5;
};

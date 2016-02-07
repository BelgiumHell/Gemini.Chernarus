/////////////////////////
//Script made by Jochem//
/////////////////////////
_dummy = objNull;
_vehicle = objNull;
_time = 0;
musicPlay = false;

while{alive player}do{
	player setDamage 0;
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

	//Zeus
	if(!isNull curatorCamera)then{
		_curator = (getAssignedCuratorLogic player);
		[[_curator],{
			_curator = _this select 0;
			_curator addCuratorEditableObjects [(allUnits - [cacheGroupLeader]),false];
			_curator addCuratorEditableObjects [allDead,false];
			_curator addCuratorEditableObjects [vehicles,false];
		}] remoteExec ["BIS_fnc_spawn", 2];

	};
	sleep 10;
};

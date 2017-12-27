/////////////////////////
//Script made by Jochem//
/////////////////////////
//Fix vanilla damage
player setDamage 0;
//Pardon TK'ing
player addRating 2000;

//Music
if (musicPlay && (vehicle player) != player && musicTime < serverTime) then {
    detach musicDummy;
    deleteVehicle musicDummy;
    musicTime = serverTime + 57;
    musicDummy = "Land_HelipadEmpty_F" createVehicle [0, 0, 0];
    musicDummy attachTo [(vehicle player), [0, 0, 0]];
    [[musicDummy], {
        (_this select 0) say3D "heliSpeakerSound";
    }] remoteExec ["BIS_fnc_spawn", 0, true];
    musicVehicle = (vehicle player);
} else {
    if (!musicPlay || (vehicle player) != musicVehicle) then {
        musicTime = 0;
        detach musicDummy;
        deleteVehicle musicDummy;
    };
};

//RWR
if (vehicle player in (jetTargets + heliTargets)) then {
	playSound ["rwrSound", true];
};

//Radio jamming (experimental)
if ((count (nearestObjects [player, ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F"], 2000])) > 0) then {
	if (radioHandle == -1) then {
		{
		    orgChannel pushBack [_x, [_x] call acre_api_fnc_getRadioChannel];
		} forEach ([] call acre_api_fnc_getCurrentRadioList);

		orgChannel = [[] call acre_api_fnc_getCurrentRadio] call acre_api_fnc_getRadioChannel;
		radioHandle = [{
			_radios = [] call acre_api_fnc_getCurrentRadioList;
			{
		    	[_x, round (random 14)] call acre_api_fnc_setRadioChannel;
			} forEach _radios;
		}, 1, []] call CBA_fnc_addPerFrameHandler;
	};
} else {
    if (radioHandle != -1) then {
	    [radioHandle] call CBA_fnc_removePerFrameHandler;

	    {
	        [_x select 0, _x select 1] call acre_api_fnc_setRadioChannel;
	    } forEach orgChannel;
	    orgChannel = [];

        radioHandle = -1;
    };
};

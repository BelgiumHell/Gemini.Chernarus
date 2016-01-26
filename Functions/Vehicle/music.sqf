/////////////////////////
//Script made by Jochem//
/////////////////////////
_dummy = objNull;
_vehicle = objNull;
_time = 0;
musicPlay = false;

waitUntil{musicPlay};

while{alive player}do{
    if(musicPlay && (vehicle player) != player && _time < time)then{
        detach _dummy;
        deleteVehicle _dummy;
        _time = time + 57;
        _dummy = "Land_HelipadEmpty_F" createVehicle (getPos (vehicle player));
        _dummy attachTo [(vehicle player),[0,0,0]];
        [[],{
            (_this select 0) say3D "heliSpeakerSound";
        }] remoteExec ["BIS_fnc_spawn", 0, true];
        _vehicle = (vehicle player);
    }else{
        if(!musicPlay || (vehicle player) == player)then{
            _time = 0;
            detach _dummy;
            deleteVehicle _dummy;
        };
    };
};

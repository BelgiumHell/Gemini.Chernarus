/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_veh","_time"];

_type = typeOf _veh;
_pos = getPosWorld _veh;
_dir = getDir _veh;

deleteVehicle _veh;
_veh = _type createVehicle [0,0,1000];
_veh setDir _dir;
_veh setPosWorld _pos;
_veh setDamage 0;

while{true}do{
    waitUntil{sleep 45; ((!canMove _veh || !alive _veh) && ((west countSide nearestObjects [getPos _veh, ["men","car","air"], 1000]) == 0))};

    deleteVehicle _veh;
    _veh = _type createVehicle [0,0,1000];
    _veh setDir _dir;
    _veh setPosWorld _pos;
    _veh setDamage 0;
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_class"];

_posH = player modelToWorld [0,5,0];
_pos = [_posH select 0,_posH select 0,0];
_object = _class createVehicleLocal _pos;

[_object]spawn{
    params["_object"];
    while{alive _object}do{
        _posH = player modelToWorld [0,5,0];
        _pos = [_posH select 0,_posH select 0,0];
        _object setVehiclePosition [_pos, [], 0, "CAN_COLLIDE"];
    };
};

_id1 = player addAction["<t color='#0000ff'>Place object</t>",{
    player removeAction (_this select 2);
    player removeAction ((_this select 2) + 1);

    [30, [(_this select 3)], {
        _type = typeOf (_this select 0);
        _pos = getPosASL (_this select 0);
        deleteVehicle (_this select 0);
        _object = _class createVehicle _pos;
        _object setPosASL _pos;

        [[_object],{
            params["_object"];
            _actionR = ["removeObject", "Remove object", "", {deleteVehicle (_this select 0)}, {true}]call ace_interact_menu_fnc_createAction;
            [_object, 0, ["ACE_MainActions"], _actionR]call ace_interact_menu_fnc_addActionToObject;
        }] remoteExec ["BIS_fnc_spawn", 2, true];
    }, {
        deleteVehicle (_this select 0);
    }, "Building"] call ace_common_fnc_progressBar
},_object,8];
_id2 = player addAction["<t color='#ff1111'>Cancel placement</t>",{
    deleteVehicle (_this select 3);
    player removeAction ((_this select 2) - 1);
    player removeAction (_this select 2);
},_object,7];
/////////////////////////
//Script made by Jochem//
/////////////////////////
_class = _this select 0;

_object = _class createVehicle getPos player;

_object attachTo [player,[0,5,0]];
player setVariable["building",true,true];
_object setVariable ["buildHeight",0];
player setVariable ["buildObject",_object];

player addAction ["<t color='#0000ff'>Place</t>", {
    _object = (attachedObjects player select 0);
    detach _object; removeAllActions player;
    [[_object],{
        params["_object"];

        _action = _object addAction["<t color='#ff1111'>Remove</t>",{deleteVehicle (_this select 0)},"",1,true,true,"","(vehicleVarName _this) in logisticsArray"];
    }] remoteExec ["BIS_fnc_spawn", 0, true];

    [[[_object],{_action = (_this select 0) addAction["<t color='#ff1111'>Remove</t>",{deleteVehicle (_this select 0)},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
}];
player addAction ["<t color='#ff1111'>Cancel</t>", {_object = player getVariable "buildObject"; detach _object; deleteVehicle _object; removeAllActions player; player setVariable ["buildObject",objNull];}];

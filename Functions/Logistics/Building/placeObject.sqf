/////////////////////////
//Script made by Jochem//
/////////////////////////
disableSerialization;	//_display var doesn't work otherwise
_class = _this select 0;

_object = _class createVehicle getPos player;

_object attachTo [player,[0,5,0]];
player setVariable["building",true,true];
_object setVariable ["buildHeight",0];

//Add buttons to change height and rotation
//_display = findDisplay 46;
//_display displaySetEventHandler ["KeyDown","_this call JOC_buildKeypress"];

player addAction ["<t color='#0000ff'>Place</t>", {_object = (attachedObjects player select 0); detach _object; removeAllActions player;[[[_object],{_action = (_this select 0) addAction["<t color='#ff1111'>Remove</t>",{deleteVehicle (_this select 0)},"",1,true,true,"","(format[""%1"",_this]) in logisticsArray"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;}];
player addAction ["<t color='#ff1111'>Cancel</t>", {_object = (attachedObjects player select 0); detach _object; deleteVehicle _object; removeAllActions player;}];

_id = ["KeyDown", "_this call JOC_buildKeypress"] call CBA_fnc_addDisplayHandler;
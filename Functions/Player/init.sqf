/////////////////////////
//Script made by Jochem//
/////////////////////////
//Whitelisting needs to go here
//endMission "NotWhitelisted";

//Don't mind this
player enableSimulation true;
player allowDamage true;

["Preload"]call XLA_fnc_arsenal;

//[]call JOC_playerClick;
[]call JOC_createDiary;
[]call JOC_loadoutMaster;
[JOC_playerLoop, 10, []]call CBA_fnc_addPerFrameHandler;
["KeyDown", "_this call JOC_playerButton"]call CBA_fnc_addDisplayHandler;
player addEventHandler ["Fired", {_this spawn JOC_playerSmkGren}];
cduEnabled = false;
musicPlay = false;
musicDummy = objNull;
musicVehicle = objNull;
musicTime = 0;
radioHandle = -1;
orgChannel = [];

waitUntil{alive player};

//intro text
_date = date;
_year = _date select 0;
_month = _date select 1;
_day = _date select 2;
_hour = _date select 3;
_minute = _date select 4;
_rank = rank player;
_name = name player;
if(_hour < 10)then{
	_hour = format["0%1",_hour];
};
if(_minute < 10)then{
	_minute = format["0%1",_minute];
};
_textDate = format["%3/%2/%1 - %4%5hrs",_year,_month,_day,_hour,_minute];
_textName = format["%1 %2",_rank,_name];
titleText ["", "BLACK IN", 7];
[
	[
		["Gemini","<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
		[_textDate,"<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
		[_textName,"<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
        ["Molos airfield, NATO HQ","<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
        [worldName,"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",30]
	],
    1,
    1,
    "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;

//Ace interaction
//View distance
_viewDistanceI = ["ViewDistance","View distance","",{[]spawn CHVD_fnc_openDialog},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _viewDistanceI] call ace_interact_menu_fnc_addActionToObject;
//MAT
_actionMAT = ["loadMat", "Load MAT ammo", "", {[(_this select 0)]spawn JOC_crateMat;}, {((_this select 0) distance logiSpawner) < 50}] call ace_interact_menu_fnc_createAction;
["B_CargoNet_01_ammo_F", 0, ["ACE_MainActions"], _actionMAT] call ace_interact_menu_fnc_addActionToClass;
//MMG
_actionMMG = ["loadMmg", "Load MMG ammo", "", {[(_this select 0)]spawn JOC_crateMmg;}, {((_this select 0) distance logiSpawner) < 50}] call ace_interact_menu_fnc_createAction;
["B_CargoNet_01_ammo_F", 0, ["ACE_MainActions"], _actionMMG] call ace_interact_menu_fnc_addActionToClass;

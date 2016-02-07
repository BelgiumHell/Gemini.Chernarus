/////////////////////////
//Script made by Jochem//
/////////////////////////
/*while{!JOC_serverLoaded}do{
	titleText ["Mission is loading", "BLACK FADED", 0];
	sleep 0.5;
	titleText ["Mission is loading.", "BLACK FADED", 0];
	sleep 0.5;
	titleText ["Mission is loading..", "BLACK FADED", 0];
	sleep 0.5;
	titleText ["Mission is loading...", "BLACK FADED", 0];
	sleep 0.5;
};*/
sleep 0.1;
//Don't mind this
player enableSimulation true;
player allowDamage true;

//intro text
_date = date;
_year = _date select 0;
_month = _date select 1;
_day = _date select 2;
_hour = _date select 3;
_minute = _date select 4;

_rank = rank player;
_name = name player;

_textDate = format["%3/%2/%1 - %4:%5",_year,_month,_day,_hour,_minute];
_textName = format["%1 %2",_rank,_name];
player setPosASL getPosASL respawn_obj;

["Preload"]call BIS_fnc_arsenal;

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
sleep 10;


[]call JOC_playerClick;
[]call JOC_garage;
[]spawn JOC_playerLoop;
//[]call JOC_createDiary;
[]call JOC_loadoutMaster;
["KeyDown", "_this call JOC_playerButton"] call CBA_fnc_addDisplayHandler;
cduEnabled = false;

//Ace interaction
//View distance
_viewDistanceI = ["ViewDistance","View distance","",{[]spawn CHVD_fnc_openDialog},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _viewDistanceI] call ace_interact_menu_fnc_addActionToObject;
//MAT
_actionMAT = ["loadMat", "Load MAT ammo", "", {[(_this select 0)]spawn JOC_crateMat;}, {((_this select 0) distance logiSpawner) < 50}] call ace_interact_menu_fnc_createAction;
[typeOf "B_Slingload_01_Cargo_F", 0, ["ACE_MainActions"], _actionMAT] call ace_interact_menu_fnc_addActionToClass;
//MMG
_actionMMG = ["loadMmg", "Load MMG ammo", "", {[(_this select 0)]spawn JOC_crateMmg;}, {((_this select 0) distance logiSpawner) < 50}] call ace_interact_menu_fnc_createAction;
[typeOf "B_Slingload_01_Cargo_F", 0, ["ACE_MainActions"], _actionMMG] call ace_interact_menu_fnc_addActionToClass;

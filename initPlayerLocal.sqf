/////////////////////////
//Script made by Jochem//
/////////////////////////
0=["Keep calm and play your role",0,0,10] spawn BIS_fnc_dynamicText;

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

Sleep 10;

0=["Gemini",_textDate,_textName,"Chernarus"] spawn BIS_fnc_infoText;

[]spawn JOC_playerLoop;
[]spawn JOC_playerClick;
[]call JOC_garage;
["KeyDown", "_this call JOC_playerButton"] call CBA_fnc_addDisplayHandler;

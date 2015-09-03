_time = _this select 0;
_x = 0;
Crossroads = [West,"HQ"];

while{_x != _time && pilotRescued == 0 && pilotDead == 0}do{
	Sleep 1;
	_x = _x + 1;
};
Sleep 1;

if(pilotRescued == 0 && pilotDead == 0)then{
	Crossroads sideChat "The pilot bled out, mission failed";
	pilotDead = 1;
};
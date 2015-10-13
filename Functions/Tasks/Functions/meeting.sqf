_time = 10;
_x = 0;
Crossroads = [West,"HQ"];

while{_x != _time && dead == 0}do{
	Sleep 1;
	_x = _x + 1;
};

Sleep 1;

if(dead == 0)then{
	Crossroads sideChat "Meeting is over, proceed with mission";
	meeting = 1;
};
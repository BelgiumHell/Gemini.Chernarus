_time = _this select 0;
_icbm = _this select 1;
_x = 0;
Crossroads = [West,"HQ"];

while{_x != _time && (alive _icbm)}do{
    Sleep 1;
    _text = format["%1 seconds until launch",_time - _x];
    Crossroads sideChat _text;//Needs global
    _x = _x + 1;
};

Sleep 1;

launched = 1;

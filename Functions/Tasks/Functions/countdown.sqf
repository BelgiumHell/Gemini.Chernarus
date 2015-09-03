_time = _this select 0;
_x = 0;
Crossroads = [West,"HQ"];

while{_x != _time && disabled == 0 && destroyed == 0}do{
    Sleep 1;
    _text = format["%1 seconds until launch",_time - _x];
    Crossroads sideChat _text;//Needs global
    _x = _x + 1;
};

Sleep 1;

launched = 1;
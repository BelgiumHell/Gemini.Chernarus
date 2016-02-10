/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_vehicle","_active"];
_vehicle = _this select 0;
_active = 0;
_vehicle setVariable ["towing", false, true];

if(!isServer)exitWith{};

while{alive _vehicle}do{
    waitUntil{sleep 5;((count (crew _vehicle)) > 0)};    //You cant tow when not in the right vehicle(duh)

    _targetC = ((nearestObjects [_vehicle, ["car","truck","tank"], 15]) - [_vehicle]) select 0;

    _positionT = getPosASL _targetC;
    _positionV = getPosASL _vehicle;
    _positionR = [];
    if((count (_positionT - [0,0,0])) > 0)then{
        _positionR = [_positionT,8,(getDir _targetC),"Compass",((getPosASL _targetC) select 2)] call Zen_ExtendPosition;
    };

    if((_positionV distance _positionR) < 5) then{
        (driver _vehicle) addAction ["Attach vehicle", {[_this select 1]spawn JOC_towAttach;}];
        waitUntil{_positionT = getPosASL _targetC;_positionV = getPosASL _vehicle;!((_positionV distance _positionR) < 2)};
    };

    waitUntil{sleep 1;(!(_vehicle getVariable "towing"))};
    removeAllActions (driver _vehicle);
    sleep 1;
};

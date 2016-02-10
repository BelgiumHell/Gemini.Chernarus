/////////////////////////
//Script made by Jochem//
/////////////////////////
_driver = _this select 0;
_vehicle = vehicle _driver;
_target = ((nearestObjects [_vehicle, ["car","truck","tank"], 15]) - [_vehicle]) select 0;

_vehicle setVariable ["towing", true, true];
removeAllActions _driver;

//Attach with rope
rope = ropeCreate [_vehicle, [0,-4.4,0.45], _target, [0,3,-1.5], 7];

_driver addAction ["Detach", {[_this select 0]call JOC_towDetach;}];

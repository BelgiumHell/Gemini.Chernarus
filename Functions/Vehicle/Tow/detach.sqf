/////////////////////////
//Script made by Jochem//
/////////////////////////
_driver = _this select 0;
_vehicle = vehicle _driver;

ropeDestroy rope;
removeAllActions (driver _vehicle);
_vehicle setVariable ["towing", false, true];

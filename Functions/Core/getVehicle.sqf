/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_intId"];

_vehicle = objNull;

if (_intId >= 0) then {
    _vehicles = (vehicles select {[_x] call JOC_coreGetId == _intId});
    if (count _vehicles > 0) then {
        _vehicle = _vehicles select 0;
    };
};

_vehicle
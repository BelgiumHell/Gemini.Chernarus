/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_intId"];

_unit = objNull;

_units = (allUnits select {[_x]call JOC_coreGetId == _intId});
if(count _units > 0)then{
    _group = _units select 0;
};

_unit
/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_object"];

switch (typeName _object) do {
    case ("OBJECT"): {
        if (_object isKindOf "man") then {
            _object setVariable ["id", currentUnitId, true];
            currentUnitId = currentUnitId + 1;
        }else{
            _object setVariable ["id", currentVehicleId, true];
            currentVehicleId = currentVehicleId + 1;
        };
    };
    case ("GROUP"): {
        _object setVariable ["id", currentGroupId, true];
        currentGroupId = currentGroupId + 1;
    };
};

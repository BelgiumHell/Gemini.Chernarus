/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_object"];

switch (typeName _object) do {
    case ("OBJECT"): {
        _object setVariable ["id", currentUnitId, true];
        currentUnitId = currentUnitId + 1;
    };
    case ("GROUP"): {
        _object setVariable ["id", currentGroupId, true];
        currentGroupId = currentGroupId + 1;
    };
};



_index = 0;

    //Get strategic array
    //Get virtualized array
    while{typeName (["read", ["main", format["strategicArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        strategicArray pushBack (["read", ["main", format["strategicArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    {
        _array = (_x select 3);
        _name = (_array select 0);
        _marker = createMarker [_name, (_array select 1)];
        _name setMarkerShape (_array select 2);
        _name setMarkerSize (_array select 3);
        _name setMarkerBrush (_array select 4);
        _name setMarkerColor (_array select 5);
        _x set [3,_name];
    } forEach strategicArray;
    strategicCount = count strategicArray;

    //unitArray
    _index = 0;
    while{typeName (["read", ["main", format["unitArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        _array = (["read", ["main", format["unitArray_%1",_index]]] call _inidbi);
        _array set[5,call (compile (_array select 5))];
        _array set[8,call (compile (_array select 8))];
        unitArray pushBack _array;
        _index = _index + 1;
    };

    //vehicleArray
    _index = 0;
    while{typeName (["read", ["main", format["vehicleArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        _array = (["read", ["main", format["vehicleArray_%1",_index]]] call _inidbi);
        _array set[3,call (compile (_array select 3))];
        vehicleArray pushBack _array;
        _index = _index + 1;
    };

    //Orderarray
    _index = 0;
    while{typeName (["read", ["main", format["orderArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        orderArray pushBack (["read", ["main", format["orderArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //RequestArray
    _index = 0;
    while{typeName (["read", ["main", format["requestArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        requestArray pushBack (["read", ["main", format["requestArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //assignedArray
    _index = 0;
    while{typeName (["read", ["main", format["assignedArray_%1",_index],0]] call _inidbi) != typeName 0}do{
        assignedArray pushBack (["read", ["main", format["assignedArray_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //Object damage
    _damageValues = [];
    _index = 0;
    while{typeName (["read", ["main", format["damageValues_%1",_index],"0"]] call _inidbi) != typeName "0"}do{
        _damageValues append (["read", ["main", format["damageValues_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };
    {
        if(!isNil{(_damageValues select _forEachIndex)})then{
            _x setDamage (_damageValues select _forEachIndex);
        };
    } forEach objectsStart;

    //buildObjects
    _index = 0;
    while{typeName (["read", ["main", format["buildObjects_%1",_index],0]] call _inidbi) != typeName 0}do{
        buildObjects pushBack (["read", ["main", format["buildObjects_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };

    //Objects spawned on mission load
    _objectsAdded = [];
    _index = 0;
    while{typeName (["read", ["header", format["objectsAdded_%1",_index],0]] call _inidbi) != typeName 0}do{
        _objectsAdded pushBack (["read", ["header", format["objectsAdded_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };
    {
        _object = (_x select 0) createVehicle (_x select 1);
        _object setPosASL (_x select 1);
        _object setDir (_x select 2);
    } forEach _objectsAdded;

    //Buildobjects
    _buildAdded = [];
    _index = 0;
    while{typeName (["read", ["header", format["buildObjects_%1",_index],0]] call _inidbi) != typeName 0}do{
        _buildAdded pushBack (["read", ["header", format["buildObjects_%1",_index]]] call _inidbi);
        _index = _index + 1;
    };
    {
        _object = (_x select 0) createVehicle (_x select 1);
        _object setPosASL (_x select 1);
        _object setDir (_x select 2);
    } forEach _buildAdded;

    //get fobs and deploy them if applicable
    _fobArray = ["read", ["main", "fobArray",[]]] call _inidbi;
    {
        _truck = fobClass createVehicle (_x select 0);
        _truck setPosASL (_x select 0);
        _truck setDir (_x select 1);
        [_truck]call JOC_fobInit;
        fobTrucks pushBack _truck;

        if(_x select 2)then{
            [_truck]call JOC_fobDeploy;
        };
    } forEach _fobArray;

    currentUnitId = ["read", ["main", "currentUnitID", -1]] call _inidbi;
    currentVehicleId = ["read", ["main", "currentVehicleID", -1]] call _inidbi;
    currentGroupID = ["read", ["main", "currentGroupID", -1]] call _inidbi;
    currentRequestID = ["read", ["main", "currentRequestID", -1]] call _inidbi;
    jetActive = ["read", ["main", "jetActive", false]] call _inidbi;
    jetReady = ["read", ["main", "jetReady", false]] call _inidbi;
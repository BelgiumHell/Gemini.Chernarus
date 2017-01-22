/////////////////////////
//Script made by Jochem//
/////////////////////////
//[vehicleID,position,class/object,virtualizing,damage]
params["_class","_position","_virtualizing","_damage","_crew"];

vehicleArray pushBack[currentVehicleId,_position,_class,_virtualizing,_damage];

_return = currentVehicleId;
currentVehicleId = currentVehicleId + 1;

_crewPool = [];
_cargoPool = [];
_crewCount = 0;
_cargoCount = 0;
if(_crew select 0)then{
    _groupId = currentGroupID;
    currentGroupID = currentGroupID + 1;
    _crewNumber = 0;

    if(_class isKindOf "Car")then{
        _crewPool = crewClass select 0;
        _crewNumber = 1;
    }else{
        _crewPool = crewClass select 1;
        _crewNumber = 3;
    };

    while{_crewCount < _crewNumber}do{
        [_groupId,[0,0,0],_return,selectRandom _crewPool,_virtualizing,0,0.5,east,"SAFE"]call JOC_spawnUnit;
        _crewCount = _crewCount + 1;
    };
};

if(_crew select 1)then{
    _groupId = currentGroupID;
    currentGroupID = currentGroupID + 1;

    _cargoNumber = count(getArray(configFile >> "CfgVehicles" >> _x >> "getInProxyOrder")) - _crewCount;
    while{_cargoCount < _cargoNumber}do{
        [_groupId,[0,0,0],_return,selectRandom infantryPool,_virtualizing,0,0.5,east,"SAFE"]call JOC_spawnUnit;
        _cargoCount = _cargoCount + 1;
    };
};

_return
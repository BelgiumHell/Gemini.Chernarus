/////////////////////////
//Script made by Jochem//
/////////////////////////
//virtualizing
if(JOC_pauseCache)exitWith{};
//[unitID,groupID,position,vehicle,class/object,virtualizing,damage,skill,side,behaviour]
//[vehicleID,position,class/object,virtualizing,damage]

//Save original state of unitArray and vehicleArray
_orgUnitArray = [] + unitArray;
_orgVehicleArray = [] + vehArray;

_extraUnits = [];

//Delete empty groups
{
    deleteGroup _x;
} forEach (allGroups select {count (units _x) == 0});

//Give groups Id
{
    if([_x]call JOC_coreGetId == -1)then{
        _x setVariable ["id", currentGroupID, true];
        currentGroupID = currentGroupID + 1;
    };
} forEach allGroups;

//Add vehicles to vehicleArray
{
    _vehicle = _x;
    if([_vehicle]call JOC_coreGetId == -1 && count (vehArray select {_x select 3 == _vehicle}) == 0)then{
        vehicleArray pushBack [currentVehicleId,getPosAsl _vehicle,_vehicle,true,damage _vehicle];
        _vehicle setVariable["id",currentVehicleId,true];
        currentVehicleId = currentVehicleId + 1;
    };
} forEach vehicles;

//Add units to unitArray
{
    _unit = _x;
    if([_unit]call JOC_coreGetId == -1)then{
        _vehicle = [-1,[]];
        if(!isNull (objectParent _unit))then{
            _vehicle = [[vehicle _unit]call JOC_coreGetId,[_unit]call JOC_getVehicleIndex];
        };
        unitArray pushBack [currentUnitId,[group _unit]call JOC_coreGetId,getPosAsl _unit,_vehicle,_unit,!((group _unit) getVariable["JOC_caching_disabled",false]),damage _unit,skill _unit,side _unit,behaviour _unit];
        _unit setVariable["id",currentUnitId,true];
        currentUnitId = currentUnitId + 1;
    };
} forEach (allUnits - playableUnits);


{
    if(typeName (_x select 2) == "STRING")then{
        if((west countSide ((_x select 1) nearEntities[["Man","Car","Tank"], 1500])) != 0 || !(_x select 3))then{
            _veh = createVehicle[_x select 2,_x select 1,[],0,"CAN_COLLIDE"];
            _veh setVariable["id",(_x select 0),true];
            _veh setPosAsl (_x select 1);
            _veh setDamage (_x select 4);
            _x set[2,_veh];
        };
    }else{
        _id = _x select 0;
        _vehicle = _x select 2;
        if(alive _vehicle)then{
            _x set[1,getPosAsl _vehicle];
            _x set[4,damage _vehicle];
            if((west countSide ((_x select 2) nearEntities[["Man","Car","Tank"], 1500])) == 0 && (_x select 3))then{
                _x set[2,typeOf _vehicle];
                deleteVehicle _vehicle;
            };
        };
    };
} forEach vehicleArray;

_realVehicles = [];
{
    if((side _x) != west)then{
        _id = [_x]call JOC_coreGetId;
        _realVehicles pushBackUnique _id;
    };
} forEach vehicles;
_realVehicles = _realVehicles - [-1];

{
    if(typeName (_x select 4) == "STRING")then{
        if((west countSide ((_x select 2) nearEntities[["Man","Car","Tank"], 1500])) != 0 || !(_x select 5) || ((_x select 3) select 0) in _realVehicles)then{
            //Group
            _group = [_x select 1]call JOC_coreGetGroup;
            if(isNull _group)then{
                _group = createGroup (_x select 8);
                _group setVariable ["id", _x select 1, true];
            };

            //Create unit
            _unit = _group createUnit [_x select 4, [0,0,0], [], 0, "CAN_COLLIDE"];
            _unit setVariable["id",(_x select 0),true];
            [_unit] joinSilent _group;
            _unit setPosAsl (_x select 2);
            _unit setDamage (_x select 6);
            _x set[4,_unit];

            //Vehicle (0:driver 1:commander 2:gunner)
            if(((_x select 3) select 0) in _realVehicles)then{
                _vehicle = [(_x select 3) select 0]call JOC_coreGetVehicle;
                switch(((_x select 3) select 1) select 0)do{
                    case 0:{
                        _unit moveInDriver _vehicle;
                    };
                    case 1:{
                        _unit moveInCommander _vehicle;
                    };
                    case 2:{
                        _unit moveInGunner _vehicle;
                    };
                    case 3:{
                        _unit moveInTurret [_vehicle,((_x select 3) select 1) select 1];
                    };
                    case 4:{
                        _unit moveInCargo [_vehicle,((_x select 3) select 1) select 1];
                    };
                    case 5:{
                        _unit moveInAny _vehicle;
                    };
                };
            };
        };
    }else{
        _unit = _x select 4;
        if(alive _unit)then{
            _x set[1,[group _unit]call JOC_coreGetId];
            _x set[2,getPosAsl _unit];
            _x set[3,[[vehicle _unit]call JOC_coreGetId,[_unit]call JOC_getVehicleIndex]];
            _x set[6,damage _unit];
            _x set[7,skill _unit];
            _x set[8,side _unit];
            _x set[9,behaviour _unit];
            if((west countSide ((_x select 2) nearEntities[["Man","Car","Tank"], 1500])) == 0 && (_x select 5))then{
                _x set[4,typeOf _unit];
                deleteVehicle _unit;
            };
        };
    };
} forEach unitArray;

//publicVariable "unitArray";
[_orgUnitArray,unitArray,0]call JOC_publicArray;
[_orgVehicleArray,vehicleArray,1]call JOC_publicArray;
//missionNamespace setVariable["unitArray",unitArray,true];
//publicVariable "vehicleArray";
//missionNamespace setVariable["vehicleArray",vehicleArray,true];
publicVariable "currentGroupId";
publicVariable "currentUnitId";
publicVariable "currentVehicleId";

//[false]call acex_headless_fnc_rebalance;

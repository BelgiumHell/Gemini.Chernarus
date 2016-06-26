/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_groupConvoy","_array"];
_startPos = getPos (leader _groupConvoy);

waitUntil{sleep 20; ((leader _groupConvoy) distance2D (_array select 0) < 20) || (count (units _groupConvoy) == 0)};

sleep 300;
if(alive (leader _groupConvoy))then{
    _objects = east countSide ((getPos _crate) nearEntities [["Man","Car","Tank","Helicopter"],1200]);
    {
        _x setFuel 1;
        _x setVehicleAmmo 1;
        _x setDamage 0;
    } forEach _objects;
};

_groupConvoy move (_startPos);

waitUntil{sleep 20; ((leader _groupConvoy) distance2D _startPos < 20) || (count (units _groupConvoy) == 0)};

if(alive (leader _groupConvoy))then{
    waitUntil{west countSide ((getPos _jet) nearEntities [["Man","Car","Tank","Helicopter"],1200]) == 0};
    {
        deleteVehicle (vehicle _x);
        if(isNil{_x})then{
            deleteVehicle _x;
        };
    } forEach (units _groupConvoy);
};

//Convoy rtb
_heli land "LAND";
waitUntil{(getPosATL _heli) select 2 < 0.5};

//Delete convoy
waitUntil{west countSide (_startPos nearEntities [["Man","Car","Tank","Helicopter"],1200]) == 0};
{
    _veh = vehicle _x;
    {
        _veh deleteVehicleCrew _x
    } forEach crew _veh;
    deleteVehicle _veh;
} forEach (units _groupConvoy);

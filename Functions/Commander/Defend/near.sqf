/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_arg"];

_nearPos = [(_arg select 0),"",0]call JOC_cmdMiscGetNearestStrategic;
_entities = _nearPos nearEntities [["Man","Car","Tank"],((getMarkerSize (_arg select 3)) select 0)];

_availableArray = [];
{
    if(side _x == east)then{
        _availableArray pushBack _x;
    };
} forEach _entities;

_unitArray = [_availableArray, ((count _availableArray) / 4)]call Zen_ArrayGetRandomSequence;

{
    (group _x) move (_arg select 0);
} forEach _unitArray;

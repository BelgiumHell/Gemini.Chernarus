/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_category","_params","_id","_duplicate"];

_existArr = requestArray select {_x select 0 == _category && _x select 2 == _id};

if(count _existArr == 0 || _duplicate)then{
    requestArray pushBack [_category,_params,_id,[-1,false]];
};
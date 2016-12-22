/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array"];
private["_category","_clearence","_types"];

_pos = _array select 0;
_priority = _array select 1;
_type = _array select 2;
_marker = _array select 3;

_typesDirect = [];
_typesMain = [];
_typesSupport = [];

//Get category
if(_priority > 800)then{
    _category = 1;
};
if(_priority < 800 && _priority > 400)then{
    _category = 2;
}else{
    _category = 3;
};

//Possible support types
switch (_category) do {
    case 1: {
        _typesDirect = ["near"];
        _typesMain = ["convoy","heli"];
        _typesSupport = ["cas","armor"];
    };
    case 2: {
        _typesDirect = ["near"];
        _typesMain = ["convoy"];
        _typesSupport = ["armor"];
    };
    case 3:{
        _typesDirect = [];
        _typesMain = ["retreat"];
        _typesSupport = [];
    };
};

//Select types
_typeDirect = selectRandom _typesDirect;
_typeMain = selectRandom _typesMain;
_typeSupport = selectRandom _typesSupport;

//Execute
switch (_typeDirect) do {
    case ("near"): {
        requestArray pushBack [[1,5],_array,_category != 1];
    };
    default {

    };
};
switch (_typeMain) do {
    case ("convoy"): {
        requestArray pushBack [[1,2],_array,_category != 1];
    };
    case ("heli"): {
        requestArray pushBack [[1,3],_array,_category != 1];
    };
    case ("retreat"): {
        requestArray pushBack [[1,4],_array,_category != 1];
    };
    default {

    };
};
switch (_typeSupport) do {
    case ("armor"): {
        requestArray pushBack [[1,0],_array,_category != 1];
    };
    case ("cas"): {
        requestArray pushBack [[1,1],_array,_category != 1];
    };
    default {

    };
};

//Chance for arty support
if((-1*_category) + 2.5 + (random 1) < 1)then{
    requestArray pushBack [[1,1],_array,_category != 1];
};

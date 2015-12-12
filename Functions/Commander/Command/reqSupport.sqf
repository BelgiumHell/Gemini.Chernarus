/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array","oUnits","bUnits"];
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

//Get support types
if(_type in ["radar","aa","arty","radio"])then{
    _clearence = false;
}else{
    _clearence = true;
};

//Possible support types
switch (_category) do {
    case 1: {
        _typesDirect = ["near"];
        _typesMain = ["convoy","heli"];
        _typesSupport = ["cas","armor"];
    };
    case 2: {
        if(_clearence)then{
            _typesDirect = ["near"];
            _typesMain = ["convoy"];
            _typesSupport = ["armor","arty"];
        }else{
            _typesDirect = ["near"];
            _typesMain = ["convoy"];
            _typesSupport = ["armor"];
        };
    };
    case 3:{
        if(_clearence)then{
            _typesDirect = ["near"];
            _typesMain = ["retreat"];
            _typesSupport = ["arty"];
        }else{
            _typesDirect = ["near"];
            _typesMain = ["retreat"];
            _typesSupport = [];
        };
    };
};

//Select types
_typeDirect = _typesDirect call BIS_fnc_selectRandom;
_typeMain = _typesMain call BIS_fnc_selectRandom;
_typeSupport = _typesSupport call BIS_fnc_selectRandom;

//Execute
switch (_typeDirect) do {
    case ("near"): {
        [_array]call JOC_cmdDefNear;
    };
    default {

    };
};
switch (_typeMain) do {
    case ("convoy"): {
        [_array,_category]call JOC_cmdDefConvoy;
    };
    case ("heli"): {
        [_array,_category]call JOC_cmdDefHeli;
    };
    case ("retreat"): {
        [_array]call JOC_cmdDefRetreat;
    };
    default {

    };
};
switch (_typeSupport) do {
    case ("armor"): {
        [_array,_category]call JOC_cmdDefArmor;
    };
    case ("arty"): {
        [_array]call JOC_cmdDefArty;
    };
    case ("cas"): {
        [_array]call JOC_cmdDefCas;
    };
    default {

    };
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array","oUnits","bUnits"];
private["_category","_clearence","_types"];

_pos = _array select 0;
_priority = _array select 1;
_type = _array select 2;
_marker = _array select 3;

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

//Choose support type
switch (_category) do {
    case 1: {
        _types = ["convoy","heli","near","cas"];
    };
    case 2: {
        if(_clearence)then{
            _types = ["convoy","near","arty"];
        }else{
            _types = ["convoy","near"];
        };
    };
    case 3:{
        if(_clearence)then{
            _types = ["near","arty"];
        }else{
            _types = ["retreat"];
        };
    };
};







/*
_bUnitsPos = [];
{
    _bUnitsPos pushBack (getPos _x);
} forEach _bUnits;

_aimPos = [_bUnitsPos]call JOC_findCenter;
*/

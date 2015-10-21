/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_veh","_bord","_trg"];
_veh = _this select 0;
_trgID = _this select 1;

switch (_trgID) do {
    case 0:{
        _bord = garage_scrap;
        _trg = trg_scrap;
    };
    case 1:{
        _bord = garage_scrap_air;
        _trg = trg_rep_0;
    };
    case 2:{
        _bord = garage_scrap_plane;
        _trg = trg_rep_2;
    };
};

_id = _bord addAction["Scrap vehicle",{_veh = _this select 3; _pad = (_veh getVariable "pad"); _pad setVariable["count",((_pad getVariable "count") - 1),true]; deleteVehicle _veh},_veh];
waitUntil{sleep 0.3;((_veh distance _trg) > 10)};
_bord removeAction _id;

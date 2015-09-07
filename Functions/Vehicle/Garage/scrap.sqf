private ["_veh"];
_veh = _this select 0;

_id = trg_scrap addAction[ "Scrap vehicle",{_veh = _this select 3; _pad = (_veh getVariable "pad"); _pad setVariable["count",((_pad getVariable "count") - 1)]; deleteVehicle _veh},_veh];
waitUntil{sleep 0.3;((_veh distance garage_scrap) > 7)};
garage_scrap removeAction _id;
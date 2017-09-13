/////////////////////////
//Script made by Jochem//
/////////////////////////
transformers = nearestObjects [(getMarkerPos "mrk_area"),["Land_dp_transformer_F"],worldSize*2.0^0.5];
lights = nearestObjects [(getMarkerPos "mrk_area"),["Streetlamp"],worldSize*2.0^0.5];

{
    _x addEventHandler ["Killed",{
        _transformer = (_this select 0);
        _nearTransformers = nearestObjects [(getPos _transformer),["Land_dp_transformer_F"],100];
        {
            _x setDamage 1;
        } forEach _nearTransformers;

        {
            if (((getPos _x) nearestObject "Land_dp_transformer_F") == _transformer) then {
                _x switchLight "OFF";
            };
        } forEach lights;
    }];
} forEach transformers;

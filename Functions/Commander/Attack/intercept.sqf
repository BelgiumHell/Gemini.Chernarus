/////////////////////////
//Script made by Jochem//
/////////////////////////
//Spawn jet
_airfieldPos = [getPos ((jetTargets + heliTargets) select 0),"airfield",1000]call JOC_cmdMiscGetNearestStrategic;
if(count (_airfieldPos - [0,0,0]) == 0)exitWith{false};
_list = nearestObjects [_airfieldPos, ["LocationRespawnPoint_F"], 1000];
_pos = getPos (_list select 0);
_jet = (jetPoolAA call BIS_fnc_selectRandom) createVehicle _pos;
_jet setDir (direction (_list select 0));
createVehicleCrew _jet;
(driver _jet) setVariable["JOC_caching_disabled",true];

[_jet]spawn{
    params["_jet"];
    while{true}do{
        jetTargets = jetTargets - [objNull] - allDead;
        heliTargets = heliTargets - [objNull] - allDead;
        if(count (jetTargets + heliTargets) == 0 || (fuel _jet) < 0.15)exitWith{
            _airfieldArray = [];
            {
                if((_x select 2) == "airfield" && (_x select 4) == east)then{
                    _airfieldArray pushBack _x;
                };
            } forEach strategicArray;
            _array = _airfieldArray select 0;
            _id = parseNumber ([(_array select 3),"mrk_airfield_","",true] call Zen_StringFindReplace);
            _jet landAt _id;

            waitUntil{sleep 20; speed _jet < 10};
            waitUntil{west countSide ((getPos _jet) nearEntities [["Man","Car","Tank","Helicopter"],1200]) == 0};
            deleteVehicle _jet;
            jetActive = false;
        };

        _target = (jetTargets + heliTargets) select 0;
        _jet doMove (getPos _target);

        sleep 5;
    };
};

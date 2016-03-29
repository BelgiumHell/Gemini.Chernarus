params["_arg"];

//Get locations
_airfieldPos = [(_arg select 0),"airfield",500]call JOC_cmdMiscGetNearestStrategic;
if(count (_airfieldPos - [0,0,0]) == 0)exitWith{false};
_basePos = [(_arg select 0),"base",500]call JOC_cmdMiscGetNearestStrategic;
if(count (_basePos - [0,0,0]) == 0)exitWith{false};

JOC_pauseCache = true;

//Spawn helicopters
_list = nearestObjects [_airfieldPos, ["LocationRespawnPoint_F"], 2000];
_posHeli = getPos (_list select 0);
_heli = [_posHeli,(airPool call BIS_fnc_selectRandom),0] call Zen_SpawnHelicopter;
_gunship = [_posHeli,(casPool call BIS_fnc_selectRandom),100] call Zen_SpawnHelicopter;
(leader (group _heli)) setVariable["JOC_caching_disabled",true];
(leader (group _gunship)) setVariable["JOC_caching_disabled",true];

//Order attack chopper move
(group _gunship) move (_arg select 0);

//Spawn infantry
_group = [[0,0,0], east, "infantry", getNumber(configFile >> "CfgVehicles" >> (typeOf _heli) >> "transportSoldier"),"Basic"] call Zen_SpawnInfantry;
(leader _group) setVariable["JOC_caching_disabled",true];

JOC_pauseCache = false;

//Order pickup
_landPos  = _basePos findEmptyPosition [0,300,(typeOf _heli)];
_handle = [_heli,[_landPos,_landPos],_group]spawn Zen_OrderExtraction;
waitUntil{sleep 20; scriptDone _handle};

//Insert troops
_handle = [_heli,[_insertPos],_group,"full",20,(["fastrope","land"]call BIS_fnc_selectRandom)]spawn Zen_OrderInsertion;
waitUntil{sleep 20; scriptDone _handle};

//Heli rtb
_handle = [_heli,_posHeli]spawn Zen_OrderHelicopterLand;
waitUntil{sleep 20; scriptDone _handle};

//Delete heli
waitUntil{west countSide (_posHeli nearEntities [["Man","Car","Tank","Helicopter"],1200]) == 0};
{
    deleteVehicle _x;
} forEach crew _heli;
deleteVehicle _heli;

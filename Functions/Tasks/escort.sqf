//Set up var
arrived = 0;
dead = 0;
_x = 0;
_y = 0;
_ok = 0;
_name = [5] call Zen_StringGenerateRandom;


//Get location
_location = [0,0,["mrk_safeZone"],1,0,0,[1,0,10],0,0,[1,5,5],[1,[0,0,0],10]] call Zen_FindGroundPosition;


//Create task
_task = [west,"A VIP needs escorting to an evacuation location. Once at the location, SOF will take further care off him.","Escort VIP",_location,true,"",_name] call Zen_InvokeTask;


//Spawn vip
_groupVip = createGroup west;
vip = _groupVip createUnit ["B_officer_F",getMarkerPos "mrk_return", [], 0, "NONE"];
vip allowFleeing 0;


//Spawn dropoff trigger
_trgdrop = createTrigger ["EmptyDetector",_location];
_trgdrop setTriggerArea [50,50,50,false];
_trgdrop setTriggerActivation ["CIV","PRESENT", false];
_trgdrop setTriggerStatements ["crate distance thistrigger < 20","arrived = 1",""];


//Spawn dead trigger
_trgdead = createTrigger ["EmptyDetector",_missionDropoffzone];
_trgdead setTriggerStatements ["!alive CIV","dead = 1",""];



/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_targetC"];

_targetC = jetTargets select 0;

while{(alive (units jetG select 0)) OR (alive (units jetG select 1))}do {
	scopeName "loop1";
	while{!(canMove _targetC) or (isNull _targetC)}do{
		jetTargets deleteAt 0;
		if(count jetTargets == 0)then{
			_airfieldID = [false,airfieldOccup]call Zen_ValueFindInArray;
			(vehicle (units jetG select 0)) landAt _airfieldID;
			(vehicle (units jetG select 0)) addEventHandler["LandedTouchDown",{deleteVehicle ((crew (_this select 0)) select 0);deleteVehicle (_this select 0);}];
			(vehicle (units jetG select 1)) landAt _airfieldID;
			(vehicle (units jetG select 1)) addEventHandler["LandedTouchDown",{deleteVehicle ((crew (_this select 0)) select 0);deleteVehicle (_this select 0);}];
			breakOut "loop1";
		}else{
			_targetC = jetTargets select 0;
		};
	};
	[jetG,(position _targetC)] call BIS_fnc_taskAttack;
	[jetG, 1] setWPPos (position _targetC);
	deleteWaypoint [jetG, 2];
	jetG reveal _targetC;
	Sleep 10;
};

Sleep 1800;

jetActive = false;

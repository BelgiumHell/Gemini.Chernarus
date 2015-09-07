/////////////////////////
//Script made by Jochem//
/////////////////////////
//Spawn general
_groupGenaral = createGroup east;
genaral = _groupGenaral createUnit ["O_officer_F",_locationS, [], 0, "NONE"];
genaral allowFleeing 0;

_s = 0;
while{_s < officerCount}do{
	_groupOfficer = createGroup east;
	_officer = _groupOfficer createUnit ["O_officer_F",_locationS, [], 0, "NONE"];
	_officer allowFleeing 0;
	
   	_s = _s + 1;
};
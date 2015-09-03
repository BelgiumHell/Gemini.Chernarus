/////////////////////////
//Script made by Jochem//
/////////////////////////
_airfields = airfieldMarkers;
airfieldGroup = createGroup east;

_s = 0;
while{_s < count _airfields}do{
	[(_airfields select _s),_s]spawn JOC_spawnAirfield;
	airfieldT = (_airfields select _s);
   	_s = _s + 1;
};
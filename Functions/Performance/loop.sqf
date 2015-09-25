/////////////////////////
//Script made by Jochem//
/////////////////////////
baseObjects = nearestObjects [(getMarkerPos "mrk_safeZone"), ["All"], 1200];

[]spawn {
	while{true}do{
		[]call JOC_addToZeus;
		sleep 30;
	};
};

while{true}do{
	[]call JOC_objectRemove;
	[]call JOC_itemRemove;
	sleep 600;
};

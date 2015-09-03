/////////////////////////
//Script made by Jochem//
/////////////////////////
[]spawn JOC_cmdHeli;

while{true}do{
	waitUntil{sleep 60;(count bluTowns >= 1)};
	sleep (3600/((count opTowns)/2));
	if((count bluTowns >= 1) && cmdAttack)then{
		[]spawn JOC_cmdAttack;
		cmdAttack = false;
	};
};
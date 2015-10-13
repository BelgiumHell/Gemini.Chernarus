/////////////////////////
//Script made by Jochem//
/////////////////////////
[]spawn JOC_cmdHeli;
[]call JOC_cmdOfficers;

//Counter-attack
[]spawn{
	while{true}do{
		waitUntil{sleep 60;(count bluTowns >= 1)};
		sleep (3600/((count opTowns)/2));
		if((count bluTowns >= 1) && cmdAttack)then{
			[]spawn JOC_cmdAttack;
			cmdAttack = false;
		};
	};
};

//Convoy
[]spawn{
	while{true}do{
		sleep (2500/(count opTowns));
		[]spawn JOC_cmdConvoy;
	};
};

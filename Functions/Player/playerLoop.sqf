/////////////////////////
//Script made by Jochem//
/////////////////////////
while{alive player}do{
	player setDamage 0;
	player addRating 2000;
	if((count (nearestObjects [player, ["Land_TTowerBig_2_F"], 2000])) >= 1)then{
		player setVariable ["tf_sendingDistanceMultiplicator", 0.2];
	}else{
		player setVariable ["tf_sendingDistanceMultiplicator", 1];
	};
	Sleep 60;
};
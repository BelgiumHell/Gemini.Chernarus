/////////////////////////
//Script made by Jochem//
/////////////////////////
if(side player == west)then{
	player setPosASL getPosASL respawn_obj;
};

[]spawn JOC_playerLoop;
[]spawn JOC_vehMusic;
cduEnabled = false;
[]spawn JOC_loadoutMaster;

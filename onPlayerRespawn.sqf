if(side player == west)then{
	player setPosASL getPosASL respawn_obj;
};
if(side == east)then{
	_airfieldID = [false,airfieldOccup]call Zen_ValueFindInArray;
	_mrkN = format ["mrk_infSpawn_%1",_airfieldID];
	_respawnPos = getMarkerPos _mrkN;
	player setPosASL getPosASL _respawnPos;
};

zeusMod addCuratorEditableObjects [[player],false];
cduEnabled = false;
//[]spawn JOC_loadoutMaster;





/*player addEventHandler ["fired", {
if((_this select 0) distance respawn_obj < 500)then{
	hint "Don't fire in base!";
	deleteVehicle (_this select 6);
};
}]; //Base protection*/

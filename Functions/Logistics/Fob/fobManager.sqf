/////////////////////////
//Script made by Jochem//
/////////////////////////
_fobCount = -1;

while{true}do{
	_truck = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy" createVehicle [16000,16000,0];
	_truck setDir getDir fobSpawn;
	_truck setPosASL getPosASL fobSpawn;
	_truck setDamage 0;
	zeusMod addCuratorEditableObjects [[_truck],false];
	[_truck] call JOC_fobInit;

	_fobCount = _fobCount + 1;

	waitUntil {Sleep 60;((_fobCount < (count bluTowns)) && (!(alive _truck)))};
	deleteVehicle _truck;
	Sleep 5;
};
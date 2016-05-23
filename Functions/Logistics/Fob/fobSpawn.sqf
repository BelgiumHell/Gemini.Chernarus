/////////////////////////
//Script made by Jochem//
/////////////////////////
if(!isServer)exitWith{};

if(isNil{fobCount})then{
	fobCount = 0;
	fobComposition = [["Land_PressureWasher_01_F",[1.98267,2.32764,0.0905981],0.114227],["Land_Portable_generator_F",[2.17505,1.29932,0.0897746],0.102936],["Land_PaperBox_open_full_F",[5.78296,2.11523,0.0905986],243.18],["CamoNet_BLUFOR_big_Curator_F",[3.6,-1.6,0.0905986],0.115265],["Land_PaperBox_open_full_F",[6.3186,3.83057,0.0905986],205.563],["B_CargoNet_01_ammo_F",[5.59106,-0.307617,0.0905986],196.608],["Land_FieldToilet_F",[5.41748,-3.00879,0.0906048],88.8292],["Land_Cargo20_military_green_F",[8.05762,-0.856445,0.0905976],272.526]];
	publicVariable "fobComposition";

	[]call JOC_fobSpawn;
}else{
	_veh = (nearestObjects [(getPos fobSpawn),["All"],3] - [fobSpawn]);
	if((count _veh) >= 1 or (count fobTrucks >= fobLimit))then{
		hint "Pad not clear or max vehicles reached";
	}else{
		_truck = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy" createVehicle [16000,16000,0];
		_truck setDir getDir fobSpawn;
		_truck setPosworld getPosworld fobSpawn;
		_truck setDamage 0;
		fobTrucks pushBack _truck;
		publicVariable "fobTrucks";
		[_truck]call JOC_fobInit;
		[_truck]call JOC_fobManager;
	};
};

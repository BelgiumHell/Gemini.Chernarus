/////////////////////////
//Script made by Jochem//
/////////////////////////
[[[],{
	logiSpawner addAction["Spawn spare wheel",{["ACE_Wheel"]call JOC_depotSpawnObject}];
	logiSpawner addAction["Spawn spare track",{["ACE_Track"]call JOC_depotSpawnObject}];
	logiSpawner addAction["Spawn cargo net",{["B_CargoNet_01_ammo_F"]call JOC_depotSpawnObject}];
	logiSpawner addAction["Spawn medical crate",{["B_Slingload_01_Medevac_F"]call JOC_depotSpawnObject}];
	logiSpawner addAction["Spawn ammo crate",{["B_Slingload_01_Ammo_F"]call JOC_depotSpawnObject}];
	logiSpawner addAction["Spawn fuel crate",{["B_Slingload_01_Fuel_F"]call JOC_depotSpawnObject}];
	logiSpawner addAction["Spawn repair crate",{["B_Slingload_01_Repair_F"]call JOC_depotSpawnObject}];
	logiSpawner addAction["Spawn building crate",{["B_Slingload_01_Cargo_F"]call JOC_depotSpawnObject}];
}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

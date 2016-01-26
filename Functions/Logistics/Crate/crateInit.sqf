/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_crate"];
_cratetype = typeOf _crate;

//Clear crate inventory
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;

//FOB crate
if(_cratetype == "B_Slingload_01_Cargo_F")then{
	[_crate]spawn JOC_buildCrateInit;
};

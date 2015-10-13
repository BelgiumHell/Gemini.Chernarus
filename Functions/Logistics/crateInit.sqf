/////////////////////////
//Script made by Jochem//
/////////////////////////

_crate = _this select 0;
_cratetype = typeOf _crate;

//FOB crate
if(_cratetype == "B_Slingload_01_Cargo_F")then{
	[_crate]spawn JOC_buildCrateInit;
};
/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_box","_unit","_uniforms","_vests","_helmets","_backpacks"];
_box = _this select 0;

_weapons = [
	"arifle_MX_F",
	"arifle_MXC_F",
	"RH_m4_ris",
	"RH_m4a1_ris",
	"RH_m16a4",
	"",
	"RH_m9",
	"tf47_at4_HEDP"
];

_magazines = [
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"RH_30Rnd_556x45_Mk262"
];
_uniforms = [
	"TRYK_U_B_MARPAT_Wood_Tshirt",
	"TRYK_U_B_MARPAT_Wood",
	"TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",
	"TRYK_U_B_WOOD_MARPAT_CombatUniform",
	"TRYK_B_USMC_R_ROLL",
	"TRYK_B_USMC_R",
	"TRYK_T_camo_wood_marpat_BG",
	"TRYK_hoodie_FR",
	"TRYK_U_B_C01_Tsirt"

];
_vests = [
	"TRYK_V_ArmorVest_Brown2",
	"TRYK_V_ArmorVest_Brown"
];
_helmets = [
	"TRYK_H_Helmet_MARPAT_Wood",
	"TRYK_H_Booniehat_MARPAT_WOOD"
];
_backpacks = [
	"TRYK_B_AssaultPack_MARPAT_Wood",
	"TRYK_B_Kitbag_Base"
];
_items = [
	"ACE_EarPlugs",
	"ACE_atropine",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_quikclot",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
	"ACE_bodyBag",
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_packingBandage",
	"ACE_personalAidKit",
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"ACE_SpareBarrel",
	"ACE_IR_Strobe_Item",
	"ACE_CableTie",
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	"ACE_M84",

	"SMA_eotech552",
	"SMA_eotech552_3XDOWN",
	"RH_compm4s",
	"RH_ta01nsn",
	"RH_ta31rmr",
	"optic_MRCO",
	"optic_Hamr",
	"muzzle_snds_H",
	"RH_fa556"

];
weaponsT = _weapons;
magazinesT = _magazines;
backpacksT = _backpacks;
//Tank
if(player in [anv1,anv2,anv3])then{
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Pilot
if(player in [s1,s2,v1,v2,rip1,rip2])then{
	_weapons = ["hgun_PDW2000_F","hgun_Pistol_Signal_F"];
	_magazines = ["30Rnd_9x21_Mag","6Rnd_GreenSignal_F"];
	_uniforms = ["U_B_PilotCoveralls","U_B_HeliPilotCoveralls"];
	_vests = ["V_TacVest_oli"];
	_helmets = ["H_PilotHelmetFighter_B","H_PilotHelmetHeli_B"];
	_backpacks = ["B_Parachute"];
	_items = (_items + []);
};

//Command
if(player in [cmd1,cmd2])then{
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Recon
if(player in [r1,r2,r3,r4])then{
	_weapons = (_weapons + ["rhs_weap_m4a1_carryhandle_grip2","SMA_Mk17_black","RH_Hk416"]);
	_magazines = (_magazines + []);
	_uniforms = [];
	_vests = [];
	_helmets = [];
	_backpacks = [];
	_items = (_items + ["rhsusf_acc_nt4_black","SMA_spSCAR_762"]);
};

//Autorifleman
if(player in [a5,b5,c5])then{
	_weapons = (_weapons + ["LMG_Mk200_F","RH_M27IAR"]);
	_magazines = (_magazines + ["200Rnd_65x39_Belt","200Rnd_65x39_Belt_Tracer_Red","rhs_200rnd_556x45_M_SAW","RH_60Rnd_556x45_M855A1"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Marksman
if(player in [a3,b3,c3,r2])then{
	_weapons = (_weapons + ["arifle_MX_SW_F","RH_m110","RH_sr25ec","srifle_EBR_F"]);
	_magazines = (_magazines + ["RH_20Rnd_762x51_AR10","RH_20Rnd_762x51_M80A1"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["RH_leu_mk4","RH_m110sd","optic_SOS","optic_DMS","optic_LRPS"]);
};

//AT(rifleman)
if(player in [r1,r2,r3,r4])then{
	_weapons = (_weapons + ["tf47_m3maaws","tf47_at4_HE","tf47_at4_HEDP","tf47_at4_HEAT"]);
	_magazines = (_magazines + ["tf47_m3maaws_HEDP"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//HAT
if(player in [h2,h3])then{
	_weapons = (_weapons + ["tf47_m3maaws","rhs_weap_fgm148"]);
	_magazines = (_magazines + ["tf47_m3maaws_ILLUM","tf47_m3maaws_SMOKE","tf47_m3maaws_HE","tf47_m3maaws_HEDP","tf47_m3maaws_HEAT","rhs_fgm148_magazine_AT"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["tf47_optic_m3maaws"]);
};

//Leader
if(player in [a1,a2,b1,b2,c1,c2])then{
	_weapons = (_weapons + ["RH_m16a4gl","RH_m4_ris_m203 ","RH_m4a1_ris_m203"]);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Radio operator
if(player in [r1,r2,r3,r4])then{
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};



[_box,_weapons,false,true] call BIS_fnc_addVirtualWeaponCargo;
[_box,_magazines,false,true] call BIS_fnc_addVirtualMagazineCargo;
[_box,_backpacks,false,true] call BIS_fnc_addVirtualBackpackCargo;
[_box,(_uniforms + _vests + _helmets + _items),false,true] call BIS_fnc_addVirtualItemCargo;
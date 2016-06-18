	/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_box","_unit","_uniforms","_vests","_helmets","_backpacks"];
params["_box"];

_weapons = [
	"rhs_weap_m4a1_carryhandle",
	"rhsusf_weap_m9"
];

_magazines = [
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhsusf_mag_15Rnd_9x19_JHP",

	"rhs_mag_m18_green",
    "rhs_mag_m18_purple",
    "rhs_mag_m18_red",
    "rhs_mag_m18_yellow",
    "rhs_mag_m67",
    "rhs_mag_an_m8hc",
    "rhs_mag_an_m14_th3"
];
_uniforms = [
	"rhs_uniform_FROG01_wd"
];
_vests = [
	"rhsusf_spc_rifleman"
];
_helmets = [
	"rhsusf_lwh_helmet_marpatwd",
	"rhsusf_lwh_helmet_marpatwd_ess"
];
_backpacks = [
	"rhsusf_assault_eagleaiii_coy"
];
_items = [
	"ACE_EarPlugs",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_quikclot",
	"ACE_packingBandage",
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
	"ACE_wirecutter",
	"ACE_Tripod",
	"ACE_SpottingScope",
	"ACE_Sandbag_empty",
	"ACE_EntrenchingTool",
	"ACE_SpraypaintBlue",
    "ACE_SpraypaintGreen",
    "ACE_SpraypaintRed",
    "ACE_RangeTable_82mm",
    "ACE_Flashlight_MX991",
    "ACE_Flashlight_XL50",
	"ACE_MapTools",

	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"ItemGps",

	"rhsusf_acc_ACOG2",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552",

	"rhsusf_ANPVS_15"
];

//Tank
if((vehicleVarName player) in ["anv1","anv2","anv3"])then{
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = [];
	_helmets = [];
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Pilot
if((vehicleVarName player) in ["s1","s2","v1","v2","rip1","rip2"])then{
	_weapons = ["rhsusf_weap_MP7A1_base_f","hgun_Pistol_Signal_F"];
	_magazines = ["rhsusf_mag_40Rnd_46x30_FMJ","6Rnd_GreenSignal_F"];
	_uniforms = ["U_B_PilotCoveralls","U_B_HeliPilotCoveralls"];
	_vests = ["V_TacVest_oli"];
	_helmets = ["H_PilotHelmetFighter_B","H_PilotHelmetHeli_B"];
	_backpacks = ["B_Parachute"];
	_items = (_items + []);
};

//Command
if((vehicleVarName player) in ["cmd1","cmd2"])then{
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Medic
if((vehicleVarName player) in [])then{
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = [(_uniforms + [])];
	_vests = ["rhsusf_spc_corpsman"];
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["ACE_personalAidKit","ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250","ACE_surgicalKit","ACE_tourniquet","ACE_atropine","ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250","ACE_bodyBag","ACE_epinephrine","ACE_morphine"]);
};

//Autorifleman
if((vehicleVarName player) in ["a5","b5","c5"])then{
	_weapons = (_weapons + ["rhs_weap_m249_pip_S","rhs_weap_m27iar"]);
	_magazines = (_magazines + ["rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_T_SAW","rhs_200rnd_556x45_B_SAW"]);
	_uniforms = [(_uniforms + [])];
	_vests = ["rhsusf_spc_mg","rhsusf_spc_iar"];
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["rhsusf_acc_ELCAN"]);
};

//Marksman
if((vehicleVarName player) in ["a3","b3","c3","r2"])then{
	_weapons = (_weapons + ["rhs_weap_sr25_ec","rhs_6b28_ess"]);
	_magazines = (_magazines + ["rhsusf_20Rnd_762x51_m118_special_Mag","rhsusf_20Rnd_762x51_m993_Mag"]);
	_uniforms = (_uniforms + []);
	_vests = ["rhsusf_spc_marksman"];
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["optic_DMS","lerca_1200_tan"]);
};

//AT(rifleman)
if((vehicleVarName player) in [])then{
	_weapons = (_weapons + ["rhs_weap_M136_hedp","rhs_weap_M136_heat","rhs_weap_M136_hp"]);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//HAT
if((vehicleVarName player) in ["h2"])then{
	_weapons = (_weapons + ["tf47_m3maaws","rhs_weap_fgm148"]);
	_magazines = (_magazines + ["tf47_m3maaws_ILLUM","tf47_m3maaws_SMOKE","tf47_m3maaws_HE","tf47_m3maaws_HEDP","tf47_m3maaws_HEAT","rhs_fgm148_magazine_AT"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["tf47_optic_m3maaws"]);
};

//Teamleader
if((vehicleVarName player) in ["a1_1","a2_1","b1_1","b2_1","c1_1","c2_1"])then{
	_weapons = (_weapons + ["rhs_weap_m4a1_carryhandle_m203"]);
	_magazines = (_magazines + ["rhsusf_40mm_HE","rhsusf_40mm_HEDP"]);
	_uniforms = (_uniforms + []);
	_vests = ["rhsusf_spc_Teamleader"];
	_helmets = (_helmets + ["rhsusf_lwh_helmet_marpatwd_headset"]);
	_backpacks = (_backpacks + []);
	_items = (_items + ["Binocular"]);
};

//Squadleader
if((vehicleVarName player) in ["a0_1","b0_1","c0_1"])then{
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = ["rhsusf_spc_squadleader"];
	_helmets = (_helmets + ["rhsusf_lwh_helmet_marpatwd_headset"]);
	_backpacks = (_backpacks + []);
	_items = (_items + ["Binocular"]);
};

//Recon
if((vehicleVarName player) in ["r1","r2","r3","r4","r5","r6"])then{
	_weapons = (_weapons + ["rhs_weap_M590_5RD","rhs_weap_sr25_ec","rhs_6b28_ess","rhs_weap_m4a1_carryhandle_m203","rhs_weap_M107","rhs_weap_mk18_KAC","rhs_weap_hk416d10_LMT","rhs_weap_m72a7"]);
	_magazines = (_magazines + ["rhsusf_mag_10Rnd_STD_50BMG_M33"]);
	_uniforms = (_uniforms + []);
	_vests = ["V_Chestrig_rgr","V_PlateCarrier1_rgr"];
	_helmets = ["rhs_Booniehat_marpatwd","rhsusf_mich_bare_norotos_alt"];
	_backpacks = (_backpacks + []);
	_items = (_items + ["G_Bandanna_khk","ACE_NVG_Gen4","rhsusf_acc_rotex5_grey","rhsusf_acc_anpeq15side_bk","optic_Hamr","rhsusf_acc_SpecterDR_3d"]);
};



[_box,_weapons,false,true] call XLA_fnc_addVirtualWeaponCargo;
[_box,_magazines,false,true] call XLA_fnc_addVirtualMagazineCargo;
[_box,_backpacks,false,true] call XLA_fnc_addVirtualBackpackCargo;
[_box,(_uniforms + _vests + _helmets + _items),false,true] call XLA_fnc_addVirtualItemCargo;

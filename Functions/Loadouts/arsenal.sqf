/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_box"];

_action1 = ["give343", "Get AN/PRC-343", "", {(_this select 1) addItem "ACRE_PRC343";}, {true}] call ace_interact_menu_fnc_createAction;
_action2 = ["give152", "Get AN/PRC-152", "", {(_this select 1) addItem "ACRE_PRC152";}, {true}] call ace_interact_menu_fnc_createAction;
_action3 = ["give117", "Get AN/PRC-117F", "", {(_this select 1) addItem "ACRE_PRC117F";}, {true}] call ace_interact_menu_fnc_createAction;
[_box, 0, ["ACE_MainActions"], _action1] call ace_interact_menu_fnc_addActionToObject;
[_box, 0, ["ACE_MainActions"], _action2] call ace_interact_menu_fnc_addActionToObject;
[_box, 0, ["ACE_MainActions"], _action3] call ace_interact_menu_fnc_addActionToObject;

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
	"rhsusf_lwh_helmet_marpatwd_blk_ess"
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
	"rhs_weap_optic_smaw", 

	"rhsusf_ANPVS_15", 

	"ACRE_PRC343", 
	"ACRE_PRC152", 
	"ACRE_PRC117F", 

	"rhs_googles_black"
];

//Command
if ((vehicleVarName player) in ["s_1", "s_1_1", "s_2_1"]) then {
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Medic
if ((vehicleVarName player) in ["s_2", "s_1_2", "s_1_2", "s_1_1_2", "s_1_2_2", "s_2_1_2", "s_2_2_2"]) then {
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = [(_uniforms + [])];
	_vests = ["rhsusf_spc_corpsman"];
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["ACE_personalAidKit", "ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_surgicalKit", "ACE_tourniquet", "ACE_atropine", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250", "ACE_bodyBag", "ACE_epinephrine", "ACE_morphine"]);
};

//RTO
if ((vehicleVarName player) in ["s_3", "s_1_3", "s_2_3"]) then {
	_weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Squad leader
if ((vehicleVarName player) in ["s_1_1_1", "s_1_2_1", "s_2_1_1", "s_2_2_1"]) then {
    _weapons = (_weapons + []);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = ["rhsusf_spc_squadleader"];
	_helmets = (_helmets + ["rhsusf_lwh_helmet_marpatwd_headset_blk"]);
	_backpacks = (_backpacks + []);
	_items = (_items + ["Binocular"]);
};

//Teamleader
if ((vehicleVarName player) in ["s_1_1_a_1", "s_1_1_b_1", "s_1_2_a_1", "s_1_2_b_1", "s_2_1_a_1", "s_2_1_b_1", "s_2_2_a_1", "s_2_2_b_1"]) then {
	_weapons = (_weapons + ["rhs_weap_m4a1_carryhandle_m203"]);
	_magazines = (_magazines + ["rhsusf_40mm_HE", "rhsusf_40mm_HEDP"]);
	_uniforms = (_uniforms + []);
	_vests = ["rhsusf_spc_Teamleader"];
	_helmets = (_helmets + ["rhsusf_lwh_helmet_marpatwd_headset_blk"]);
	_backpacks = (_backpacks + []);
	_items = (_items + ["Binocular"]);
};

//Autorifleman
if ((vehicleVarName player) in ["s_1_1_a_2", "s_1_1_b_2", "s_1_2_a_2", "s_1_2_b_2", "s_2_1_a_2", "s_2_1_b_2", "s_2_2_a_2", "s_2_2_b_2"]) then {
	_weapons = (_weapons + ["rhs_weap_m249_pip_S", "rhs_weap_m27iar"]);
	_magazines = (_magazines + ["rhs_200rnd_556x45_M_SAW", "rhs_200rnd_556x45_T_SAW", "rhs_200rnd_556x45_B_SAW"]);
	_uniforms = [(_uniforms + [])];
	_vests = ["rhsusf_spc_mg", "rhsusf_spc_iar"];
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["rhsusf_acc_ELCAN"]);
};

//Ass. autorifleman
if ((vehicleVarName player) in ["s_1_1_a_3", "s_1_1_b_3", "s_1_2_a_3", "s_1_2_b_3", "s_2_1_a_3", "s_2_1_b_3", "s_2_2_a_3", "s_2_2_b_3"]) then {
	_weapons = (_weapons + []);
	_magazines = (_magazines + ["rhs_200rnd_556x45_M_SAW", "rhs_200rnd_556x45_T_SAW", "rhs_200rnd_556x45_B_SAW"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//Rifleman
if ((vehicleVarName player) in ["s_1_1_a_4", "s_1_1_b_4", "s_1_2_a_4", "s_1_2_b_4", "s_2_1_a_4", "s_2_1_b_4", "s_2_2_a_4", "s_2_2_b_4"]) then {
	_weapons = (_weapons + ["rhs_weap_M136_hedp", "rhs_weap_M136_heat", "rhs_weap_M136_hp"]);
	_magazines = (_magazines + []);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + []);
};

//MAT
if ((vehicleVarName player) in ["h2"]) then {
	_weapons = (_weapons + ["tf47_m3maaws", "rhs_weap_fgm148"]);
	_magazines = (_magazines + ["rhs_mag_smaw_HEDP", "rhs_mag_smaw_HEAA", "rhs_mag_smaw_SR", "rhs_fgm148_magazine_AT"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["rhs_weap_smaw_green"]);
};

//Replace XLA with BIS if you're not using XLA fixed arsenal
[_box, _weapons, false, true] call XLA_fnc_addVirtualWeaponCargo;
[_box, _magazines, false, true] call XLA_fnc_addVirtualMagazineCargo;
[_box, _backpacks, false, true] call XLA_fnc_addVirtualBackpackCargo;
[_box, (_uniforms + _vests + _helmets + _items), false, true] call XLA_fnc_addVirtualItemCargo;

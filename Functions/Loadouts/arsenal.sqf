/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_box","_unit","_uniforms","_vests","_helmets","_backpacks"];
_box = _this select 0;

_weapons = [
	"rhs_weap_m4_carryhandle"
];

_magazines = [
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
];
_uniforms = [
	"rhs_uniform_cu_ocp"
];
_vests = [
	"rhsusf_iotv_ocp_Rifleman"
];
_helmets = [
	"rhsusf_ach_helmet_ocp"
];
_backpacks = [
	"rhsusf_assault_eagleaiii_ocp"
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

	"rhsusf_acc_ACOG2",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552"
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
	_weapons = (_weapons + ["rhs_weap_m4a1_carryhandle_grip2"]);
	_magazines = (_magazines + []);
	_uniforms = [];
	_vests = [];
	_helmets = [];
	_backpacks = [];
	_items = (_items + []);
};

//Autorifleman
if(player in [a5,b5,c5])then{
	_weapons = (_weapons + ["rhs_weap_m249_pip_S","RH_M27IAR"]);
	_magazines = (_magazines + ["rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_T_SAW","rhs_200rnd_556x45_B_SAW","RH_60Rnd_556x45_M855A1"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["rhsusf_acc_ELCAN"]);
};

//Marksman
if(player in [a3,b3,c3,r2])then{
	_weapons = (_weapons + ["rhs_weap_sr25_ec"]);
	_magazines = (_magazines + ["rhsusf_20Rnd_762x51_m118_special_Mag"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + []);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + []);
	_items = (_items + ["rhsusf_acc_LEUPOLDMK4","optic_SOS","optic_DMS","optic_LRPS"]);
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
	_weapons = (_weapons + ["RH_m4_ris_m203 ","RH_m4a1_ris_m203"]);
	_magazines = (_magazines + ["rhsusf_40mm_HE","rhsusf_40mm_HEDP"]);
	_uniforms = (_uniforms + []);
	_vests = (_vests + ["rhsusf_iotv_ocp_Teamleader"]);
	_helmets = (_helmets + []);
	_backpacks = (_backpacks + ["tf_rt1523g_big_rhs"]);
	_items = (_items + []);
};

//Medic
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

//File I use for pasting arsenal export; not used in mission

comment "Exported from Arsenal by Jochem";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "rhs_uniform_FROG01_wd";
this addItemToUniform "FirstAidKit";
this addItemToUniform "rhsusf_ANPVS_14";
this addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";
this addVest "rhsusf_spc_light";
for "_i" from 1 to 5 do {this addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
this addBackpack "B_Bergen_hex_F";
this addItemToBackpack "ACE_wirecutter";
this addItemToBackpack "rhs_mag_smaw_HEAA";
this addItemToBackpack "rhs_mag_smaw_HEDP";
this addItemToBackpack "rhs_mag_smaw_SR";
this addHeadgear "rhsusf_lwh_helmet_marpatwd_headset_blk";
this addGoggles "rhs_googles_black";

comment "Add weapons";
this addWeapon "rhs_weap_m4_carryhandle";
this addPrimaryWeaponItem "rhsusf_acc_anpeq15_top";
this addPrimaryWeaponItem "rhsusf_acc_ACOG2_USMC";
this addWeapon "rhs_weap_smaw_green";
this addSecondaryWeaponItem "rhs_weap_optic_smaw";
this addWeapon "Binocular";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";

comment "Set identity";
this setFace "WhiteHead_10";
this setSpeaker "Male12ENG";




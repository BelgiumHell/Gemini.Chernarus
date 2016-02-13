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
for "_i" from 1 to 2 do {this addItemToUniform "ACE_fieldDressing";};
this addItemToUniform "ACE_morphine";
this addItemToUniform "Chemlight_blue";
for "_i" from 1 to 3 do {this addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
this addVest "V_PlateCarrier1_rgr";
this addItemToVest "ACRE_PRC343_ID_1";
this addItemToVest "HandGrenade";
this addItemToVest "Chemlight_blue";
this addHeadgear "rhsusf_mich_bare_norotos_alt";
this addGoggles "G_Bandanna_khk";

comment "Add weapons";
this addWeapon "rhs_weap_m4a1_carryhandle_m203";
this addPrimaryWeaponItem "rhsusf_acc_nt4_black";
this addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
this addPrimaryWeaponItem "optic_Hamr";
this addWeapon "Binocular";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadioAcreFlagged";
this linkItem "ACE_NVG_Gen4";

comment "Set identity";
this setFace "WhiteHead_11";
this setSpeaker "ACE_NoVoice";

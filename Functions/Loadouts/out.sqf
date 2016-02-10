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
this addItemToUniform "ACRE_PRC343_ID_1";
this addItemToUniform "rhs_mag_rgn";
this addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";
this addVest "V_Chestrig_rgr";
this addItemToVest "rhs_m136_mag";
this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
this addBackpack "rhsusf_assault_eagleaiii_coy";
this addHeadgear "rhsusf_lwh_helmet_marpatwd";

comment "Add weapons";
this addWeapon "rhs_weap_m27iar";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadioAcreFlagged";

comment "Set identity";
this setFace "WhiteHead_11";
this setSpeaker "ACE_NoVoice";

/////////////////////////
//Script made by Jochem//
/////////////////////////

//Check for special
if(!(player in [r1,r2,r3,r4,s1,s2,v1,v2,rip1,rip2,cmd1,cmd2]))then{

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
	player addVest "TRYK_V_ArmorVest_Brown2";
	player addHeadgear "TRYK_H_Helmet_MARPAT_Wood";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "tf_microdagr";
	player linkItem "tf_anprc152_1";
};
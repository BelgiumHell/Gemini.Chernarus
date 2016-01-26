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

	player forceAddUniform "rhs_uniform_FROG01_d";
	player addVest "rhsusf_spc_rifleman";
	player addHeadgear "rhsusf_lwh_helmet_marpatd_ess";

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "tf_microdagr";
	player linkItem "tf_anprc152_1";
};

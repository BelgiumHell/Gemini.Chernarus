poolInfantry = ["rhs_vdv_rifleman", "rhs_vdv_efreitor", "rhs_vdv_engineer", "rhs_vdv_grenadier", "rhs_vdv_at", "rhs_vdv_aa", "rhs_vdv_strelok_rpg_assist", "rhs_vdv_junior_sergeant", "rhs_vdv_machinegunner", "rhs_vdv_machinegunner_assistant", "rhs_vdv_marksman", "rhs_vdv_medic", "rhs_vdv_LAT", "rhs_vdv_RShG2", "rhs_vdv_sergeant"];//Infantry classnames
poolSf       = ["rhs_vdv_recon_marksman_vss", "rhs_vdv_recon_marksman_asval", "rhs_vdv_recon_grenadier_scout", "rhs_vdv_recon_rifleman_scout", "rhs_vdv_recon_rifleman_scout_akm"];//Special forces classnames (#getRekt)
poolStaticAA = ["RHS_ZU23_VDV"];//AA statics
poolStaticAT = [];//AT statics
poolStaticMG = ["rhs_KORD_high_VDV"];//MG statics
poolCar      = ["rhs_tigr_m_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_vdv"];//Car classnames
poolTruck    = ["rhs_kamaz5350_vdv", "rhs_kamaz5350_open_vdv"];//Truck classnames
poolApc      = ["rhs_btr80a_vdv", "rhs_btr80_vdv"];//APC classnames
poolIfv      = ["rhs_bmd4ma_vdv", "rhs_bmd4_vdv", "rhs_bmp2k_vdv", "rhs_bmp2d_vdv", "rhs_bmd2m"];//IFV classnames
poolTank     = ["rhs_t90a_tv", "rhs_t80ue1", "rhs_t90_tv", "rhs_t80um"];//Tank classnames
poolSupport  = ["RHS_Ural_Fuel_VDV_01", "rhs_gaz66_ammo_vdv"];//Support classnames
poolAir      = ["RHS_Mi8AMT_vdv", "RHS_Mi8mt_Cargo_vdv", "RHS_Mi8MTV3_vdv"];//Transport helicopter classnames
poolCas      = ["RHS_Mi24V_vdv", "RHS_Ka52_vvs", "rhs_mi28n_vvs"];//Cas helicopters classnames
poolJetAG    = ["RHS_Su25SM_KH29_vvs"];//Jet classnames (anti-ground)
poolJetAA    = ["RHS_T50_vvs_blueonblue"];//Jet classnames (anti-air)
classCrew    = "rhs_vdv_combatcrew";//Crewman classname
classPilot   = "rhs_pilot";//Pilot classname
classOfficer = ""; //Officer classname
classArty    = "rhs_2s3_tv";//Arty classname
classAA      = "rhs_zsu234_aa";//AA classname
classFob     = "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy";//Fob classname
classEmpty   = "Land_Airport_center_F";//Large object, don't change or delete
poolRoof     = ["Land_Offices_01_V1_F", "Land_WIP_F"];//Buildings with roofs statics can spawn on

compAA = [
	["Land_HBarrier_5_F", [-5.47656, 1.81201, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagFence_Corner_F", [-1.71533, -0.626221, 2.75], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_TentA_F", [-3.72852, -1.52466, 0], 270, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagFence_Short_F", [-1.71045, -2.18335, 2.75], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_BagFence_Short_F", [-3.36523, -0.625977, 2.75], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrier_5_F", [4.43018, 0.593994, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_TentA_F", [-3.74658, -3.12036, 0], 270, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrier_3_F", [2.40576, -3.72974, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagBunker_Tower_F", [-3.3418, -3.71289, -0.00190163], 0, 1, 0, [0, 0], "", "", true, false], 
	[selectRandom poolStaticAA, [-3.00684, -1.99243, 2.75], 359.998, 1, 0, [-0.000417155, 0.00129716], "", "", true, false], 
	["Land_BagFence_Corner_F", [-4.87695, -0.570313, 2.75], 270, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrier_5_F", [4.43115, 6.30103, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_BagFence_Short_F", [-4.9502, -2.43188, 2.75], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_HBarrier_5_F", [-5.33154, 6.15991, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	["rhs_weapon_crate", [-4.54199, -5.52417, 3.8147e-006], 270, 1, 0.00877635, [0.00222836, 0.000684464], "", "", true, false], 
	[classAA, [-0.0166016, 9.25, -0.0452938], 0, 0, 0, [-0.0155337, -0.110973], "", "", true, false], 
	["Land_HBarrier_3_F", [0.317383, -7.6123, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	[selectRandom poolStaticMG, [-4.17578, -5.94312, 2.75], 180, 1, 0, [0.0756089, 0.129799], "", "", true, false], 
	["Land_HBarrier_5_F", [4.4082, 11.9761, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_HBarrier_5_F", [-5.35449, 11.835, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_HBarrier_5_F", [0.0717773, 13.2031, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrier_5_F", [-5.53516, 13.2017, 0], 0, 1, 0, [0, 0], "", "", true, false]
];

compArty = [
	[selectRandom poolStaticAA, [0.252441, 0.818115, -0.12567], 0, 1, 0, [0.0426026, -0.00463006], "", "", true, false], 
	["Land_BagFence_Short_F", [-1.43555, -1.11475, -0.000999928], 45, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagFence_Round_F", [0.398438, -2.40845, -0.00130129], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagFence_Round_F", [-2.70557, 0.848633, -0.00130129], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_BagFence_Short_F", [2.39941, -1.22363, -0.000999928], 135, 1, 0, [0, -0], "", "", true, false], 
	["Land_BagFence_Short_F", [-1.48975, 2.6604, -0.000999928], 135, 1, 0, [0, -0], "", "", true, false], 
	["Land_BagFence_Round_F", [3.77002, 0.677246, -0.00130129], 270, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagFence_Short_F", [2.47705, 2.56299, -0.000999928], 45, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagFence_Round_F", [0.5, 3.96069, -0.00130129], 180, 1, 0, [0, 0], "", "", true, false], 
	["Land_BagBunker_Small_F", [6.94531, -5.71558, 0], 270, 1, 0, [0, 0], "", "", true, false], 
	[selectRandom poolStaticMG, [6.75049, -5.87964, -0.0809221], 90, 1, 0, [0.130883, 0.0550158], "", "", true, false], 
	["Land_HBarrierTower_F", [-2.38965, -8.85669, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierWall6_F", [-10.1738, -5.59399, 0], 270, 1, 0, [0, 0], "", "", true, false], 
	[selectRandom poolStaticMG, [-2.45361, -10, 2.26], 180, 1, 0, [10.7606, 6.28659], "", "", true, false], 
	["Land_HBarrierWall6_F", [5.78223, -12.2153, 0], 180, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierTower_F", [-12.3477, 5.15698, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	["Land_HBarrierTower_F", [12.2202, 6.55273, 0], 270, 1, 0, [0, 0], "", "", true, false], 
	[classArty, [2, 12, 0.1], 0, 0, 0, [0.410539, -0.00342147], "", "", true, false], 
	["Land_HBarrierWall_corner_F", [-8.49854, -11.1118, 0], 180, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierWall_corner_F", [-14.0825, -0.0703125, 0], 180, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierWall6_F", [15.6533, 0.0756836, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	[selectRandom poolStaticMG, [-13.5, 5.37256, 2.26], 270, 1, 0, [0.735671, 0.865245], "", "", true, false], 
	["Land_HBarrierWall_corner_F", [11.4741, -10.6375, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	[selectRandom poolStaticMG, [13.3, 6.83789, 2.26], 90, 1, 0, [12.5229, -4.18807], "", "", true, false], 
	["Land_HBarrierWall_corridor_F", [15.0449, -5.66943, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	[classArty, [-7, 12, 5], 0, 0, 0, [0.410539, -0.00342147], "", "", true, false], 
	["Land_HBarrierWall6_F", [-15.6904, 12.2119, 0], 270, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierTower_F", [7.7085, 18.0156, 0], 180, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierWall6_F", [-0.48584, 21.3452, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierWall6_F", [15.561, 14.6404, 0], 90, 1, 0, [0, -0], "", "", true, false], 
	[selectRandom poolStaticMG, [7.95068, 19, 2.26], 0, 1, 0, [7.00475, -0.224557], "", "", true, false], 
	["Land_HBarrierWall6_F", [-8.98291, 21.3491, 0], 0, 1, 0, [0, 0], "", "", true, false], 
	["Land_HBarrierWall_corner_F", [-14.5635, 19.6301, 0], 270, 1, 0, [0, 0], "", "", true, false], 
    ["Land_HBarrierWall_corner_F", [13.9624, 20.2239, 0], 0, 1, 0, [0, 0], "", "", true, false]
];
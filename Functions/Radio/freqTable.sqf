/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
    []call TFAR_fnc_processGroupFrequencySettings;

    /*(group r1) getVariable "tf_sw_frequency") select 3) select 0)
    (group h1) getVariable "tf_sw_frequency") select 3) select 0)
    (group log1) getVariable "tf_sw_frequency") select 3) select 0)
    (group anv1) getVariable "tf_sw_frequency") select 3) select 0)
    (group s1) getVariable "tf_sw_frequency") select 3) select 0)
    (group v1) getVariable "tf_sw_frequency") select 3) select 0)
    (group rip1) getVariable "tf_sw_frequency") select 3) select 0)*/

    "mrk_freq_alpha_1" setMarkerText ("ASL SW: "+((((group a0_1) getVariable "tf_sw_frequency") select 2) select 0));
    "mrk_freq_alpha_2" setMarkerText ("A1 SW: "+((((group a1_1) getVariable "tf_sw_frequency") select 2) select 0));
    "mrk_freq_alpha_3" setMarkerText ("A2 SW: "+((((group a2_1) getVariable "tf_sw_frequency") select 2) select 0));

    "mrk_freq_bravo_1" setMarkerText ("BSL SW: "+((((group b0_1) getVariable "tf_sw_frequency") select 2) select 0));
    "mrk_freq_bravo_2" setMarkerText ("B1 SW: "+((((group b1_1) getVariable "tf_sw_frequency") select 2) select 0));
    "mrk_freq_bravo_3" setMarkerText ("B2 SW: "+((((group b2_1) getVariable "tf_sw_frequency") select 2) select 0));

    "mrk_freq_charlie_1" setMarkerText ("CSL SW: "+((((group c0_1) getVariable "tf_sw_frequency") select 2) select 0));
    "mrk_freq_charlie_2" setMarkerText ("C1 SW: "+((((group c1_1) getVariable "tf_sw_frequency") select 2) select 0));
    "mrk_freq_charlie_3" setMarkerText ("C2 SW: "+((((group c2_1) getVariable "tf_sw_frequency") select 2) select 0));

    "mrk_freq_cmd" setMarkerText ("CMD SW: "+((((group cmd1) getVariable "tf_sw_frequency") select 2) select 0));

    sleep 5;
};

/////////////////////////
//Script made by Jochem//
/////////////////////////
player createDiarySubject ["wiki","Wiki"];
player createDiaryRecord ["wiki",
["Radios",
"
<br />Enemy radio towers will jam communication (done by constant channel switching) of any radio within a specific radius (default: 2000m). To stop this from happening destroy the tower jamming communications.
"
]];

player createDiaryRecord ["wiki",
["Saving",
"
<br />Mission is saved every 5 minutes. Threre are 2 DB's, one serves as backup, every 10 minutes main and backup get switched.
"
]];

player createDiaryRecord ["wiki",
["Anti-Air",
"
<br />Radars are functional in this mission: they take into account terrain interception,
meaning you can use hills and objects to shield you from being detected. If you are detected, you'll be revealed to all AA on the map and there might me a chance
that an enemy jet will scramble to intercept you. If you are being painted by a radar, a sound will play to notify you.
There's currently no option to disable the sound, but this is planned for a future version.
"
]];

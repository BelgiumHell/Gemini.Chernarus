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
<br />Saving is possible at the laptop on the bridge of the nimitz, and only when all players are at base (for safety reasons and to prevent abuse).
Logged in admins are able to save whenever they see fit
"
]];

player createDiaryRecord ["wiki",
["Anti-Air",
"
<br />Radars are functional in this mission: they have a range of 6000m (by default) and also take into account terrain interception,
meaning you can use hills to shield you from being detected. If you are detected, there might me a chance (not really based around chance, more a threshold)
that an enemy jet will scramble to intercept you. If you are being painted by a radar, a sound will play to notify you.
There's currently no option to disable the sound, but this is planned for a future version.
"
]];

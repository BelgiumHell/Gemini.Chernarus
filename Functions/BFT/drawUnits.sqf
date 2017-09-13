/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_units"];
{
    _marker = createMarkerLocal [format ["mrk_bft_unit_%",_forEachIndex],getPos _x];
} forEach _units;
while{true}do{
    {
        format ["mrk_bft_unit_%",_forEachIndex] setMarkerPos (getPos _x);
    } forEach _units;
};

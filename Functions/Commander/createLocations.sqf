/////////////////////////
//Script made by Jochem//
/////////////////////////
//AA
[]call JOC_cmdInitAA;

//Airfield
[]call JOC_cmdInitAirfield;

//Arty
[]call JOC_cmdInitArty;

//Base
[]call JOC_cmdInitBase;

//Factory
[]call JOC_cmdInitFactory;

//Mines
[]call JOC_cmdInitMine;

//Radiotowers
[]call JOC_cmdInitRadio;

//Town
[]call JOC_cmdInitTown;

{
    _marker = _x select 3;
    _marker setMarkerAlpha 0;
    //[_marker,_forEachIndex]spawn JOC_monitorStrategic;
} forEach strategicArray;

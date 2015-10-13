/////////////////////////
//Script made by Jochem//
/////////////////////////
artyGroup = createGroup east;

_s = 0;
while{_s < artyCount}do{
	[_s]spawn JOC_arty;
   	_s = _s + 1;
};

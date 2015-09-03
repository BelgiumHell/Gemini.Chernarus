/////////////////////////
//Script made by Jochem//
/////////////////////////
sleep 10;

_s = 0;
while{_s < mineCount}do{
	[]spawn JOC_mineField;
   	_s = _s + 1;
};
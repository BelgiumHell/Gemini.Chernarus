/////////////////////////
//Script made by Jochem//
/////////////////////////
_targetTown = 0;
_startTown = 0;
_ok = 0;
_count = 0;
_dis = 4000;
while{_ok == 0}do{
	_targetTown = opTowns select (round random (count opTowns));
	
	{
		_disP = (getPos _targetTown) distance (getPos _x);
		if(_disP >= _dis or _disP >= 4000)then{
			_dis = _disP;
			_startTown = _x;
			_ok = 1;
			if(true)exitWith{};
		};
	}forEach opTowns;
	
	_count = _count + 1;
	_dis = _dis - 50;
};
_targetP = getPos _targetTown;
_startP = getPos _startTown;

hint "lol";

//Spawn convoy
_ifv = (ifvPool call BIS_fnc_selectRandom);
_trucks = [];
_truckC = (round (random 5));
_y = 0;
while{_y < _truckC}do{
	_trucks = _trucks + [(supportPool call BIS_fnc_selectRandom)];
	_y = _y + 1;
};
_apc = (apcPool call BIS_fnc_selectRandom);

_convoyA = [_ifv] + _trucks + [_apc];
testV = _convoyA;

_locationS = [_startP,[0,400],0,1,[1,400],0,[1,1,100]] call Zen_FindGroundPosition;
_convoyO = [_locationS,_convoyA]call Zen_SpawnConvoy;

_crew = [];
{
	_crew = _crew + (crew _x);
}forEach _convoyO;

zeusMod addCuratorEditableObjects [_convoyO,false];
zeusMod addCuratorEditableObjects [_crew,false];

group (_convoyO select 0) setFormation "COLUMN";
group (_convoyO select 0) setBehaviour "SAFE";
group (_convoyO select 0) move _targetP;
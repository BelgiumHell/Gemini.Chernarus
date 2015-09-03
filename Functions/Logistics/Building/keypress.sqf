/////////////////////////
//Script made by Jochem//
/////////////////////////
_object = (attachedObjects player select 0);

switch (_this select 1) do
{
	//UP -> increase height
	case 200: 
	{
		hint "up";
		detach _object;
		//_object setPosASL [getPosASL player select 0,getPosASL _object select 1,((getPosASL _object select 2) + 0.25)];
		//_relpos = player modelToWorld getPosASL _object;
		//_object attachTo [player,[0,5,(((getPosASL _object select 2) - (getPosASL player select 2)) + 0.25)]];
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") + 0.25)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") + 0.25)];
	};
	//DOWN -> decrease height
	case 208: 
	{
		hint "down";
		detach _object;
		//_object setPosASL [getPosASL player select 0,getPosASL _object select 1,((getPosASL _object select 2) - 0.25)];
		//_object attachTo [player,[0,5,(((getPosASL _object select 2) - (getPosASL player select 2)) - 0.25)]];
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") - 0.25)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") - 0.25)];
	};
	//Ignore all others
	default{};
};
/////////////////////////
//Script made by Jochem//
/////////////////////////
//[unitID,groupID,position,vehicle,class/object,virtualizing,damage,skill,side,behaviour]
params["_groupId","_position","_vehicle","_class","_virtualizing","_damage","_skill","_side","_behaviour",["_garrison",false]];

unitArray pushBack [currentUnitId,_groupId,_position,_vehicle,_class,true,0,_skill,_side,_behaviour,_garrison];
_return = currentUnitId;
currentUnitId = currentUnitId + 1;

_return
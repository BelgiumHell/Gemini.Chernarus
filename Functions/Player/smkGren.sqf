//////////////////////////////////////
//Original by Ryko, edited by Jochem//
//////////////////////////////////////
private ["_gren", "_proj", "_grenades", "_colour"];

_gren = _this select 5;
_proj = _this select 6;

_grenades = ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_VG40MD_White", "rhs_VG40MD_Green", "rhs_VG40MD_Red", "rhs_mag_m713_Red", "rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhsusf_mag_6Rnd_M714_white"];

if (!(_gren in _grenades))exitWith{};

_prevVelocity = velocity _proj;
waitUntil{
    _vel = velocity _proj;
    (_vel select 0 != _prevVelocity select 0) || (_vel select 1 != _prevVelocity select 1) || ((_vel select 0 > _prevVelocity select 0) && _prevVelocity select 0 <= 0)
};

if ((surfaceType (getPosATL _proj)) find "oncrete" == -1 && getPosATL _proj select 2 < 0.2) then {
    _proj setVelocity[0, 0, 0];
}else{
    _vel = velocity _proj;
    _proj setVelocity[(_vel select 0) / 1.5, (_vel select 1) / 1.5, (_vel select 2)];
};
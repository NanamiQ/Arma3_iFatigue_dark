/*
some function by... me.
*/
#include "\x\fatigue\addons\core\script_component.hpp"

if (!hasInterface) exitWith {};

_unit = _this select 0;
_unit = _unit select 0; // I dont know whats changed, but maybe now it will work
//player globalChat "Fatigue init";

if(isPlayer _unit && iEnemY_iFatigue_enabled) then
{
    if(iEnemY_iFatigue_use_sway) then
    {
        _unit setCustomAimCoef iEnemY_iFatigue_aimcoeff;
    };

    if(iEnemY_iFatigue_stamina_enabled) then
    {
        _unit enableStamina false;
    };

    if(iEnemY_iFatigue_fatigue_enabled) then
    {
        _unit enableFatigue false;
    };

    _unit allowSprint true;
    _respawn = _unit addEventHandler ["respawn",
    {
        _respawned_unit = _this select 0;
        if(iEnemY_iFatigue_use_sway) then
        {
            _respawned_unit setCustomAimCoef iEnemY_iFatigue_aimcoeff;
        };

        if(iEnemY_iFatigue_stamina_enabled) then
        {
            _respawned_unit enableStamina false;
        };

        if(iEnemY_iFatigue_fatigue_enabled) then
        {
            _respawned_unit enableFatigue false;
        };

        _respawned_unit allowSprint true;
    }];

    addMissionEventHandler ["Loaded",
    {
        _all_players = allPlayers - entities "HeadlessClient_F";
        {
            if(iEnemY_iFatigue_use_sway) then
            {
        	    _x setCustomAimCoef iEnemY_iFatigue_aimcoeff;
        	};

            if(iEnemY_iFatigue_stamina_enabled) then
            {
                _x enableStamina false;
            };

            if(iEnemY_iFatigue_fatigue_enabled) then
            {
                _x enableFatigue false;
            };

            _x allowSprint true;
        } forEach _all_players;
    }];
};
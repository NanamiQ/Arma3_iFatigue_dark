#define _ARMA_

class CfgPatches
{
	class fatigue_core
	{
	    name = "iFatigue";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"Extended_EventHandlers"};
		author = "iEnemY";
		version = "1.0.2";
        versionStr = "1.0.2";
        versionAr[] = {1,0,2};
	};
};

class Extended_InitPost_EventHandlers
{
	class CAManBase
	{
		class fatigue_core
		{
            init = "dummy = [_this] execVM '\x\fatigue\addons\core\functions\fnc_applyFatigue.sqf'";
		};
	};
};

class Extended_PreInit_EventHandlers
{
    advanced_fatigue_remover_state_loaded_init = "[] execVM '\x\fatigue\addons\core\functions\fnc_state_loaded_pre_init.sqf'";

    advanced_fatigue_settings_init = call compile preprocessFileLineNumbers "\x\fatigue\addons\core\functions\fnc_settings.sqf";

    // "[] execVM '\x\fatigue\addons\core\functions\fnc_settings.sqf'";

   // advanced_fatigue_remover_init = "[] execVM '\x\fatigue\addons\core\functions\fnc_disableAdvancedFatigue_pre_init.sqf'";
};
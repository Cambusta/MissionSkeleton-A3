/* 
    Entry functions that configure mission for playing

    Server entrypoint: dnct_bootstrapMissionServer
    Client entrypoint: dnct_bootstrapMissionPlayer
*/

#include "defines.sqf"
#define MODULE "bootstrap"

//  Includes
call compile preprocessFileLineNumbers "resources\values.sqf";
call compile preprocessFileLineNumbers "resources\strings.sqf";
call compile preprocessFileLineNumbers "scripts\variables.sqf";
call compile preprocessFileLineNumbers "scripts\common.sqf";
call compile preprocessFileLineNumbers "scripts\functions.sqf";
call compile preprocessFileLineNumbers "scripts\briefing.sqf";
call compile preprocessFileLineNumbers "scripts\tasks.sqf";
call compile preprocessFileLineNumbers "scripts\external.sqf";
call compile preprocessFileLineNumbers "scripts\development.sqf";

// call compile preprocessFileLineNumbers "scripts\modules\ - module name -";

dnct_bootstrapMissionServer = {

    // Mission-specific configuration

    // Common configuration
    [] spawn dnct_t_initTasks;
    [] spawn dnct_e_initExternalScriptsServer;
    
    INF(MODULE, "Server bootstrap kick-off complete")
};

dnct_bootstrapMissionPlayer = {

    params ["_player", "_didJIP"];

    // Mission specific configuration

    if (DEBUG) then
    {
        [player, 3] spawn BIS_fnc_traceBullets;
    };

    // Common configuration
    [] spawn dnct_b_initBriefing;
    [] spawn dnct_c_createScenarioDetailsEntry;
    [] spawn dnct_e_initExternalScriptsPlayer;
    [] spawn dnct_c_initInstantDeathScreen;
    [] spawn dnct_c_disablePlayerVoice;
    [] spawn dnct_c_prepareIntro;
    [] spawn dnct_c_debugSplash;

    INF(MODULE, "Client bootstrap kick-off complete")
};
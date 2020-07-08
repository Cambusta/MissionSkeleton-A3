/*
    External scripts

    Server entrypoint: dnct_e_initExternalScriptsServer
    Client entrypoint: dnct_e_initExternalScriptsPlayer
*/

// Includes
#include "defines.sqf"
#define MODULE "external"

call compile preprocessFileLineNumbers "external\uo_briefingkit.sqf";

// Entrypoint
dnct_e_initExternalScriptsServer = {

};

// Entrypoint
dnct_e_initExternalScriptsPlayer = {

    [] call UO_loadoutIndex;
};
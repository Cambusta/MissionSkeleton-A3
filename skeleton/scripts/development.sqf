/*
    Development functions

    Editing and debug-time only, not to be used in the actual mission
*/

#include "defines.sqf"
#define MODULE "development"

if (DEBUG) then
{

    dnct_d_godmode = {

        hint "Godmode";

        [player] joinSilent grpNull; 
        player allowDamage false; 
        player setCaptive true; 
        vehicle player setDamage 0; 
        vehicle player setFuel 1;
    };

    dnct_d_test_endAllObjectives = {

        ERR(MODULE, "dnct_d_test_endAllObjectives: not implemented")
    };

    dnct_d_test_endCompleteFailure = {

        ERR(MODULE, "dnct_d_test_endCompleteFailure: not implemented")
    };
};
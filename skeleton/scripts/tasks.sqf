/*
    Mission tasks initialization

    Entrypoint: dnct_t_initTasks
*/

#include "defines.sqf"
#define MODULE "tasks"

// Entrypoint
dnct_t_initTasks = {

};

dnct_t_createEscapeTask = {

    missionNamespace setVariable ["g_evacState", true, true];

    _target = param[0, east];

    [
        _target
        ,[Str_Task_Escape_Name]
        ,[Str_Task_Escape_Description
        , Str_Task_Escape_Title
        , ""]
        ,[]
        ,"CREATED"
        ,1
        ,true
        ,"escape"
    ] call BIS_fnc_taskCreate;
};

dnct_t_completeEscapeTask = {

    [Str_Task_Escape_Name, "SUCCEEDED"] call BIS_fnc_taskSetState;
    VRB(MODULE, "Escape task compelted")

};

dnct_t_failEscapeTask = {

    _state = [Str_Task_Escape_Name] call BIS_fnc_taskState;

    if (!(_state in ["SUCCEEDED", "CANCELED"])) then
    {
        [Str_Task_Escape_Name, "FAILED"] call BIS_fnc_taskSetState;
        VRB(MODULE, "Escape task failed")
    };
};
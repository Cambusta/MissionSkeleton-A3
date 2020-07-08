/*
    Mission briefing initialization

    Entrypoint: dnct_b_initBriefing
*/

#include "defines.sqf"
#define MODULE "briefing"

// Entrypoint
dnct_b_initBriefing = {

    if (isDedicated) exitWith {};

    player createDiaryRecord["Diary", [Str_Briefing_Support_Title, Str_Briefing_Support_Description]];
    player createDiaryRecord["Diary", [Str_Briefing_Execution_Title, Str_Briefing_Execution_Description]];
    player createDiaryRecord["Diary", [Str_Briefing_Mission_Title, Str_Briefing_Mission_Description]];
    player createDiaryRecord["Diary", [Str_Briefing_Situation_Title, Str_Briefing_Situation_Description]];
    player createDiaryRecord["Diary", [Str_Briefing_Background_Title, Str_Briefing_Background_Description]];
};
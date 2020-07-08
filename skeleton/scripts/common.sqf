/*
    Common helper functions
*/

#define MODULE "common"

dnct_c_getAlivePlayers = {
    
    _alivePlayers = playableUnits + switchableUnits;
    _alivePlayers
};

dnct_c_sdlog = {

    params["_level", "_tag", "_message"];

    if (!isNil "LOG_LEVEL") then
    {
        if (LOG_LEVEL >= _level) then
        {
            _inGameTime  = [daytime] call BIS_fnc_timeToString;
            _clientType = "c";
            
            if (isServer) then
            {
                if (isDedicated) then
                { _clientType = "d"; }
                else
                { _clientType = "l"; };
            };

            _levelString = "";

            switch (_level) do {
                case 1: { _levelString  = "err" };
                case 2: { _levelString  = "war" };
                case 3: { _levelString  = "inf" };
                case 4: { _levelString  = "dbg" };
                case 5: { _levelString  = "vrb" };
                default { _levelString = "???"};
            };

            if (!isNil "DEBUG") then
            {
                if (DEBUG && _level <= 3) then
                {
                    [[format["%1 %2 %3", _tag, _levelString, _inGameTime], 0.85], _message] call cba_fnc_notify;
                };
            };

            _log = format["sd(%1) %2 [%3 %4] %5", _clientType, _inGameTime, _tag, _levelString,  _message];
            diag_log text _log;
        };
    };
};

dnct_c_debugSplash = {

    if (isNil "DEBUG") exitWith {};
    if (!DEBUG) exitWith {};

    [
        [
            ["DEBUG MODE", "<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t><br/>"],
            [Val_MissionVersion, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>", 15]
        ]
    ] spawn BIS_fnc_typeText;
};

dnct_c_ensureAiEthnicity = {

    [1, MODULE, "dnct_c_ensureAiEthnicity: not implemented"] call dnct_c_sdlog;
};

dnct_c_initMissionAreaLimits = {

        if (isDedicated) exitWith {};
        if (isNil "evTrigger_AreaDenial") exitWith {};

        ["Area Limits Initialized"] spawn dnct_c_log;

        _trg  = evTrigger_AreaDenial;
        _trgArea = triggerArea _trg; 
        _loc = createLocation ["Name", getPosATL _trg, _trgArea select 0, _trgArea select 1];
        _loc setDirection (_trgArea select 2);
        _loc setRectangular (_trgArea select 3);

        _posP = position (vehicle player);

        while {true} do {
            _vehicle = (vehicle player);

            if(!((position _vehicle) in _loc)) then {
                _vehicle setPosATL _posP;
            } else {
                _posP = position _vehicle;
            };

            if(_vehicle == player) then {
                sleep 0.5;
            } else {
                sleep 1; 
            };
        };
};

dnct_c_disableFleeing = {

    _targets = param [0];
    { _x allowFleeing 0; } foreach _targets;
};

dnct_c_disableAutocombat = {

    _targets = param [0];
    { _x disableAI "AUTOCOMBAT"; } foreach _targets;
};

dnct_c_disablePlayerVoice = {

    0 fadeRadio 0;
    enableRadio false;
    enableSentences false;
    player disableConversation false;
    player setSpeaker "NoVoice";
};

dcnt_c_setUnitTraits = {

    params["_unit", "_isMedic", "_isEngineer", "_isEOD"];

    if (_isMedic) then 
    { _unit setUnitTrait ["Medic",true]; } 
    else 
    { _unit setUnitTrait ["Medic",false]; };

    if (_isEngineer) then 
    { _unit setUnitTrait ["Engineer",true]; } 
    else 
    { _unit setUnitTrait ["Engineer",false]; };

    if (_isEOD) then 
    { _unit setUnitTrait ["explosiveSpecialist",true]; } 
    else
    { _unit setUnitTrait ["explosiveSpecialist",false]; };
};

dnct_c_initInstantDeathScreen = {

    player addEventHandler["Killed", {
        _mode = "BLACK FADED";

        if (random 1 >= 0.7) then 
        { _mode = "BLACK"; };

        titleText ["", _mode];

        [] spawn 
        {
            sleep 10;
            titleText["", "BLACK IN", 5];
        };
    }];
};

dnct_c_prepareIntro = {

    if (isDedicated) exitWith {};

    1 cutText["", "BLACK IN", 10];
    waitUntil { time > 15 };

    [parseText Str_Intro_Text
        ,true
        ,nil
        ,10
        ,0.7
        ,0
    ] spawn BIS_fnc_textTiles;
};

dnct_c_createScenarioDetailsEntry = {

    player createDiarySubject["devnotes", Str_ScenarioDetails_Entry_Title];
    player createDiaryRecord["devnotes", [Str_ScenarioDetails_MissionVersion_Title, Str_ScenarioDetails_MissionVersion_Description]];
    player createDiaryRecord["devnotes", [Str_ScenarioDetails_Difficulty_Title, Str_ScenarioDetails_Difficulty_Description]];
    player createDiaryRecord["devnotes", [Str_ScenarioDetails_Externals_Title, Str_ScenarioDetails_Externals_Description]];
    player createDiaryRecord["devnotes", [Str_ScenarioDetails_Credits_Title, Str_ScenarioDetails_Credits_Description]];
};
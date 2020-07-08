call compile preprocessFileLineNumbers "scripts\bootstrap.sqf";

params["_player", "_didJIP"];
[_player, _didJIP] call dnct_bootstrapMissionPlayer;
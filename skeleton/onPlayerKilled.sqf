sleep 9;

BIS_DeathBlur ppEffectAdjust [0.0];
BIS_DeathBlur ppEffectCommit 0.0;

sleep 1;

[
    "Initialize",
    [
        player,
        [east],
        true,
        false
    ]
] call BIS_fnc_EGSpectator;
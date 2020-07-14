/// @description Constructor

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 5;
maxsp = 5;
maxAirSpeed = 12;
airResistSp = 0.16;

controller = false; // Controller use on or off. Gets turned off if the keyboard is used.
deadzone = 0.09;

has_control = true;

canJump = 0;

gunKickX = 0;
gunKickY = 0;

firingFramesL = 0; // The number of frames left before you can fire again (left side)
firingFramesR = 0; // (right side)

eltR = ELEMENT.NONE;
eltL = ELEMENT.NONE;

//audio_sound_pitch(snShot, 0.8);
/// @description Constructor

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 8;
maxsp = 5;
maxAirSpeed = 12;
airResistSp = 0.16;

controller = false; // Controller use on or off. Gets turned off if the keyboard is used.
deadzone = 0.09;

has_control = true;

lookDirection = 0; // The "direction" of the player, but don't want to use a built in variable

canJump = 0;

gunKickX = 0;
gunKickY = 0;

firingFramesL = 0; // The number of frames left before you can fire again (left side)
firingFramesR = 0; // (right side)

changeFrames = 15; // The number of frames between switching magic types
changeFramesL = 0; // (left side)
changeFramesR = 0; // (right side)

eltR = ELEMENT.NONE;
eltL = ELEMENT.NONE;

if (!instance_exists(oAimBeam)) // Create the aim beam
{
	instance_create_layer(x, y, "Wall", oAimBeam);
}

//audio_sound_pitch(snShot, 0.8);
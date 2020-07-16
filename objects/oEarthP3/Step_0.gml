/// @description Self destruct

// Inherit the parent event
event_inherited();

if (timeToLive < 0)
	instance_destroy();
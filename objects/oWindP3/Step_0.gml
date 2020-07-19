/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Rotate image
image_angle += 15;
if (image_angle > 360)
	image_angle -= 360;
	
// Move in a circle
direction += radialChange;
if (image_angle > 360)
	image_angle -= 360;

// Slowly angle outward from spiral
if (--radialChangeFrames == 0)
{
	radialChangeFrames = radialChangeFramesStart;
	radialChange--;
}
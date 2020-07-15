/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

other.burnTimeToLive = 0; // Take off any burning
other.wetFrames = 60*3; // Make the other player wet for 3 seconds

// Push the enemy back with the weight of the water
var pushDirection = point_direction(x, y, other.x, other.y);
other.pushX += lengthdir_x(weight, pushDirection);
other.pushY += lengthdir_y(weight, pushDirection);

global.waterExp++;
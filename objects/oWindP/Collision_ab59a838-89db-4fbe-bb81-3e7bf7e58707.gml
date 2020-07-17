/// @description 

// Inherit the parent event
event_inherited();

// Push the enemy back with the weight of the water
var pushDirection = point_direction(x, y, other.x, other.y);
other.pushX += lengthdir_x(weight, pushDirection);
other.pushY += lengthdir_y(weight, pushDirection);

global.windExp+=0.23;
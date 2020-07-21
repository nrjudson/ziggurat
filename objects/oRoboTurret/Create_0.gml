/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sightedPlayer = false;
distanceToSeePlayer = 1; // Max pixel distance before player is seen

actionFramesLeft = 0;
actionFramesLeftMax = 300;
framesBetweenShots = 5;

enum ROBO_ACTION
{
	NONE, // Still
	WANDERING, // Wandering around before sighting player
	MOVING, // Moving to better location to shoot player
	SHOOTING, 
	DODGING,
	EGRESSING // Running away from player
}

currAction = ROBO_ACTION.NONE;

xTarget = 0;
yTarget = 0;
moveSpeed = 5;

maxMoveDistance = 300;
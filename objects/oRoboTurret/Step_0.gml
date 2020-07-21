/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

actionFramesLeft = max(actionFramesLeft-1, 0);

if (instance_exists(oPlayer))
{
	if (!sightedPlayer)
	{
		if (distance_to_object(oPlayer) < distanceToSeePlayer && (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false)))
		{
			sightedPlayer = true;
		}
		if (pushX != 0 || pushY != 0 || flashTimeToLive != 0)
		{
			// If the enemy is pushed or hit, it knows where the player is.
			sightedPlayer = true;
		}
	}
	
	if (!sightedPlayer)
	{
		// Wander, or no action
		if (actionFramesLeft <= 0)
		{
			actionFramesLeft = irandom(actionFramesLeftMax); // Reset the next action phase frames
			
			// Randomly decide to continue to do nothing or wander
			if (irandom(1) == 0)
			{
				// Continue to do nothing
				currAction = ROBO_ACTION.NONE;
				sprite_index = sRoboTurret;
			}
			else
			{
				// Wander to random position
				currAction = ROBO_ACTION.WANDERING;
				xTarget = x + random_range(-maxMoveDistance, maxMoveDistance);
				yTarget = y + random_range(-maxMoveDistance, maxMoveDistance);
				sprite_index = sRoboTurretR;
			}
		}
		else
		{
			if (currAction == ROBO_ACTION.NONE)
			{
				// Do nothing
			}
			else if (currAction == ROBO_ACTION.WANDERING)
			{
				if (distance_to_point(xTarget, yTarget) < 10)
				{
					// Close enough. Stop doing things.
					currAction = ROBO_ACTION.NONE;
					actionFramesLeft = 0;
				}
				else
				{
					wanderDirection = point_direction(x, y, xTarget, yTarget);
				
					x += lengthdir_x(moveSpeed, wanderDirection);
					y += lengthdir_y(moveSpeed, wanderDirection);
				
					if ((wanderDirection < 90 && wanderDirection >= 0) || (wanderDirection > 270))
						image_xscale = 1;
					else
						image_xscale = -1;
				}
			}
		}
	}
	else
	{
		// Player is sighted. 
		if (currAction != ROBO_ACTION.MOVING || currAction != ROBO_ACTION.SHOOTING 
			|| currAction != ROBO_ACTION.DODGING || currAction != ROBO_ACTION.EGRESSING)
		{
			// First frame with player sighted. 
			actionFramesLeft = 0;
			currAction = ROBO_ACTION.DODGING;
		}
		if (actionFramesLeft <= 0)
		{
			
		}
	}
}
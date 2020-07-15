if (has_control)
{
	// Get player input from keyboard
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	key_jump = keyboard_check_pressed(vk_space);

	if (key_left || key_right || key_down || key_up || key_jump)
		controller = 0;
	
	// Get player input from controller
	hlaxis = gamepad_axis_value(0, gp_axislh);
	vlaxis = gamepad_axis_value(0, gp_axislv);
	hraxis = gamepad_axis_value(0, gp_axisrh);
	vraxis = gamepad_axis_value(0, gp_axisrv);
	if (abs(hlaxis) > deadzone || abs(vlaxis) > deadzone
		|| abs(hraxis) > deadzone || abs(vraxis) > deadzone)
	{
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		key_down = max(gamepad_axis_value(0, gp_axislv), 0);
		key_up = abs(min(gamepad_axis_value(0, gp_axislv), 0));
		
		controller = 1;
	}

	//// Check for controller shoulder button press
	//if (gamepad_button_check_pressed(0, gp_shoulderl)
	//	|| gamepad_axis_value(0, gp_axislv) < -.666)
	//{
	//	controller = 1;
	//	key_jump = 1;
	//}
}
else
{
	key_right = 0;
	key_left = 0;
	key_up = 0;
	key_down = 0;
	key_jump = 0;
}


// Calculate movement, deadzone stuff
var hmove = key_right - key_left; // -1 or 1
// For controller, make hmove 0 or 1 if it's very close
if (hmove < deadzone && hmove > 0)
	hmove = 0;
else if (hmove > -deadzone && hmove < 0)
	hmove = 0;
else if (hmove > 1-deadzone && hmove < 1)
	hmove = 1;
else if (hmove < -1+deadzone && hmove > -1)
	hmove = -1;
var vmove = key_down - key_up;
if (vmove < deadzone && vmove > 0)
	vmove = 0;
else if (vmove > -deadzone && vmove < 0)
	vmove = 0;
else if (vmove > 1-deadzone && vmove < 1)
	vmove = 1;
else if (vmove < -1+deadzone && vmove > -1)
	vmove = -1;

//var inTheAir = !place_meeting(x, y+1, oWall);

//var movingFasterThanRunning = true;
//if (abs(hsp) <= maxsp)
//	movingFasterThanRunning = false;

gunKickX = 0;
hsp = (hmove * walksp);
vsp = (vmove * walksp);

// Vertical movement. (Much simpler)
//vsp = (vsp + grv) + gunKickY;
//// Set max vsp in either direction
//if (vsp > maxAirSpeed) 
//	vsp = maxAirSpeed;
//if (vsp < -maxAirSpeed) 
//	vsp = -maxAirSpeed;
gunKickY = 0;

// Jumping
//canJump -= 1;
//if (canJump > 0 && key_jump)
//{
//	vsp = -8;
//	canJump = 0;
//}

// Horizontal collision
//if (place_meeting(x+hsp, y, oWall))
//{
//	// Move over one pixel at a time until we're touching the wall
//	while (!place_meeting(x+sign(hsp), y, oWall))
//	{
//		x = x + sign(hsp);
//	}
//	hsp = 0;
//}
x = x + hsp;

//// Vertical collision
//if (place_meeting(x, y+vsp, oWall))
//{
//	// Move over one pixel at a time until we're touching the wall
//	while (!place_meeting(x, y+sign(vsp), oWall))
//	{
//		y = y + sign(vsp);
//	}
//	vsp = 0;
//}
y = y + vsp;


///////////////
// Animation
///////////////
if (controller)
{
	image_angle = point_direction(0, 0, hraxis, vraxis);
}
else
{
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}

//var aimSide = sign(mouse_x - x); // +1 for mouse on the right of the player, -1 otherwise
//if (aimSide != 0)
//{
//	image_xscale = aimSide;
//}

//if (inTheAir) // If player is in the air
//{
//	sprite_index = sPlayerA;
//	image_speed = 0;
//	if (sign(vsp) > 0) 
//		image_index = 1; // Falling
//	else 
//		image_index = 0; // Jumping
//}
//else // Player is on the ground
//{
//	canJump = 10; // 10 frames left to jump
//	if (sprite_index == sPlayerA) 
//	{
//		// Player WAS just in the air, so he's landing
//		// Make some dust appear under the player when they land
//		var dustBits = 5;
//		if (key_down)
//		{
//			// if we were just in the air, then play a sfx now that we landed
//			audio_sound_pitch(snLanding, choose(0.4, 0.5, 0.6)); // adjust pitch randomly slightly
//			audio_play_sound(snLanding, 10, false);
//			dustBits = 25;
//		}
//		else
//		{
//			// if we were just in the air, then play a sfx now that we landed
//			audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2)); // adjust pitch randomly slightly
//			audio_play_sound(snLanding, 10, false);
//			dustBits = 5;
//		}
//		repeat(dustBits)
//		{
//			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
//			{
//				vsp = 0;
//			}
//		}
//	}
//	image_speed = 1;
//	if (hsp == 0)
//		sprite_index = sPlayer; // Standing
//	else
//	{
//		sprite_index = sPlayerR; // Running
//		if (aimSide != sign(hsp))
//			sprite_index = sPlayerRb; // Run backwards
//	}
//}

// Frames since last firing
firingFramesL--;
firingFramesR--;

if (firingFramesL <= 0  && 
	(mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderlb)))
{
	if (eltL == ELEMENT.NONE)
	{
		//ScreenShake(4, 10);
		with (instance_create_layer(x, y, "Magic", oProjectile))
		{
			other.firingFramesL = firingFrames;
			direction = other.image_angle; // + random_range(-12, 12);
			image_angle = direction;
		}
	}
	else if (eltL == ELEMENT.FIRE)
	{
		var inst;
		if (global.fireLevel == 1)
			inst = instance_create_layer(x, y, "Magic", oFireP1);
		else if (global.fireLevel == 2)
			inst = instance_create_layer(x, y, "Magic", oFireP2);
		else if (global.fireLevel == 3)
			inst = instance_create_layer(x, y, "Magic", oFireP3);
		with (inst)
		{
			other.firingFramesL = firingFrames;
			direction = other.image_angle; // + random_range(-12, 12);
			image_angle = direction;
		}
	}
	else if (eltL == ELEMENT.WATER)
	{
		var inst;
		if (global.waterLevel == 1)
			inst = instance_create_layer(x, y, "Magic", oWaterP1);
		else if (global.waterLevel == 2)
			inst = instance_create_layer(x, y, "Magic", oWaterP2);
		else if (global.waterLevel == 3)
			inst = instance_create_layer(x, y, "Magic", oWaterP3);
		with (inst)
		{
			other.firingFramesL = firingFrames;
			direction = other.image_angle + random_range(-2, 2);
			image_angle = direction;
		}
	}
}

if (firingFramesR <= 0  && 
	(mouse_check_button(mb_right) || gamepad_button_check(0, gp_shoulderrb)))
{
	if (eltR == ELEMENT.NONE)
	{
		//ScreenShake(4, 10);
		with (instance_create_layer(x, y, "Magic", oProjectile))
		{
			other.firingFramesR = firingFrames;
			direction = other.image_angle; // + random_range(-12, 12);
			image_angle = direction;
		}
	}
	else if (eltR == ELEMENT.FIRE)
	{
		// TODO: SOMETHING BETTER
		//fireController.shootProjectile();
		
		//ScreenShake(4, 10);
		
		var inst;
		if (global.fireLevel == 1)
			inst = instance_create_layer(x, y, "Magic", oFireP1);
		else if (global.fireLevel == 2)
			inst = instance_create_layer(x, y, "Magic", oFireP2);
		else if (global.fireLevel == 3)
			inst = instance_create_layer(x, y, "Magic", oFireP3);
		with (inst)
		{
			other.firingFramesR = firingFrames;
			direction = other.image_angle; // + random_range(-12, 12);
			image_angle = direction;
		}
	}
	else if (eltL == ELEMENT.WATER)
	{
		var inst;
		if (global.waterLevel == 1)
			inst = instance_create_layer(x, y, "Magic", oWaterP1);
		else if (global.waterLevel == 2)
			inst = instance_create_layer(x, y, "Magic", oWaterP2);
		else if (global.waterLevel == 3)
			inst = instance_create_layer(x, y, "Magic", oWaterP3);
		with (inst)
		{
			other.firingFramesR = firingFrames;
			direction = other.image_angle + random_range(-2, 2);
			image_angle = direction;
		}
	}
}
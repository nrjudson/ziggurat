/// @description Update camera

// Update destination
if (instance_exists(follow)) // follow is an object, probably oPlayer
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update actual position
x += (xTo - x) / 25;
y += (yTo - y) / 25;






camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

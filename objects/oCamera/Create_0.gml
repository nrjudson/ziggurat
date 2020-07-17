/// @description Setup camera

cam = view_camera[0];

follow = oPlayer; // since we only have 1 player, this is ok. Otherwise we'd need an instance instead of the object.

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart; // Where the camera is moving to
yTo = ystart;


/// @description Flash

// Draw sprite normally
draw_self(); // Just like calling super.draw(); 

// Draw white
if (flashTimeToLive > 0)
{
	shader_set(shWhite);
	draw_self(); 
	shader_reset();
}
else if (burnTimeToLive > 0)
{
	shader_set(shBurn);
	draw_self(); 
	shader_reset();
}
else if (wetTimeToLive > 0)
{
	shader_set(shWet);
	draw_self(); 
	shader_reset();
}
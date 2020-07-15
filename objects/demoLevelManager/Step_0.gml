// Randomly put a new player on the map

if (irandom(60*7) == 1) // Every 7 seconds on average put another guy on the screen
{
	// Randomly place enemy on screen
	instance_create_layer(irandom(RES_W), irandom(RES_H), "Enemy", oEnemy);
}
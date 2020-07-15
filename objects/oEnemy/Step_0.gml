/// @description 

if (isBurning)
{
	burnFrames--;
	if (burnFrames <= 0)
	{
		hp -= burnDamage;
		burnFrames = burnPeriod;
		with (instance_create_layer(x, y, "Magic", oDamageNum))
		{
			global.fireExp++;
			value = other.burnDamage;
			isBurnDamage = true;
		}
	}
	burnTimeToLive--;
	if (burnTimeToLive <= 0)
	{
		isBurning = false;
	}
}



if (hp <= 0)
{
	instance_destroy();
}
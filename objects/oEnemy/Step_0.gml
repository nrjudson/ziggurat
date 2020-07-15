/// @description Elemental stuff

// FIRE
burnTimeToLive--; // reduce burn time always
if (burnTimeToLive > 0)
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
}

// WATER
wetTimeToLive--; // reduce wet time always
// WATER/WIND PUSH
// TODO: make this smarter later
x += (pushX / weight) * pushCoefficient;
y += (pushY / weight) * pushCoefficient;
pushX *= 0.8;
pushY *= 0.8;
if (pushX < 0.01) pushX = 0;
if (pushY < 0.01) pushY = 0;




// Is it dead?
if (hp <= 0)
{
	instance_destroy();
}
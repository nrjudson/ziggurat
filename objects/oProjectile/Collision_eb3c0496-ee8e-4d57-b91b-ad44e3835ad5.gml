/// @description Give damage...

with (instance_create_layer(x, y, "Damage", oDamageNum))
{
	value = other.dmg;
}

other.hp -= dmg;
if (other.hp <= 0)
{
	with(other)
	{
		instance_destroy();
	}
}
other.flashTimeToLive = 4;

if (destroyOnImpact)
{
	instance_destroy();
}

/// @description Take damage...

var dmg = other.dmg;

with (instance_create_layer(other.x, other.y, "Magic", oDamageNum))
{
	value = dmg;
}

hp -= dmg;
if (hp <= 0)
{
	instance_destroy();
}
	
with(other)
{
	instance_destroy();
}
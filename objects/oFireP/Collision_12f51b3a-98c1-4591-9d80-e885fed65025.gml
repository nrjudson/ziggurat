/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Set the enemy on fire, if they're not wet
if (other.wetTimeToLive <= 0)
{
	other.burnTimeToLive = 60*15; // 15 seconds of burn
	other.burnDamage = burnDamage;
}
global.fireExp++;
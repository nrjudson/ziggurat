/// @description 

#macro RES_W 1024
#macro RES_H 768
#macro SAVEFILE "Save.sav"

display_set_gui_size(RES_W, RES_H);

randomise(); // Makes random choices later actually random
//#macro DICEROLL irandom(6) // cool save for later

//global.kills = 0;



enum ELEMENT
{
	NONE, 
	EARTH,
	WIND,
	FIRE,
	WATER
}
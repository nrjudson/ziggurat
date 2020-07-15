/// @description 

#macro RES_W 1024
#macro RES_H 768
#macro SAVEFILE "Save.sav"

display_set_gui_size(RES_W, RES_H);

randomise(); // Makes random choices later actually random
//#macro DICEROLL irandom(6) // cool save for later



global.playerScore = 0;

enum ELEMENT
{
	NONE, 
	EARTH,
	WIND,
	FIRE,
	WATER
}

global.fireLevel = 1;
global.fireExp = 0;
global.waterLevel = 1;
global.waterExp = 0;
global.earthLevel = 1;
global.earthExp = 0;
global.windLevel = 1;
global.windExp = 0;

expLevel2 = 10;
expLevel3 = 20;
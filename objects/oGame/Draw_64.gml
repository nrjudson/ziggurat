/// @description 

if (instance_exists(oPlayer))
{
	lElt = "";
	if (oPlayer.eltL == ELEMENT.NONE) lElt = "*";
	else if (oPlayer.eltL == ELEMENT.FIRE) lElt = "fire";
	else if (oPlayer.eltL == ELEMENT.WIND) lElt = "wind";
	else if (oPlayer.eltL == ELEMENT.WATER) lElt = "water";
	else if (oPlayer.eltL == ELEMENT.EARTH) lElt = "earth";
	rElt = "";
	if (oPlayer.eltR == ELEMENT.NONE) rElt = "*";
	else if (oPlayer.eltR == ELEMENT.FIRE) rElt = "fire";
	else if (oPlayer.eltR == ELEMENT.WIND) rElt = "wind";
	else if (oPlayer.eltR == ELEMENT.WATER) rElt = "water";
	else if (oPlayer.eltR == ELEMENT.EARTH) rElt = "earth";
	
	DrawSetText(c_white, fSporty24, fa_left, fa_bottom);
	draw_text(10, RES_H - 50, lElt);
	DrawSetText(c_white, fSporty24, fa_right, fa_bottom);
	draw_text(RES_W - 10, RES_H - 50, rElt);
}

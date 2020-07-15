
DrawSetText(c_black, fDamage, fa_center, fa_bottom);
// Draw 4 left-right-up-down black borders
draw_text(x-2, y-framesAlive, value);
draw_text(x+3, y-framesAlive, value);
draw_text(x, y-framesAlive-2, value);
draw_text(x, y-framesAlive+2, value);
// Draw the diagonals
draw_text(x+2, y-framesAlive+2, value);
draw_text(x-2, y-framesAlive+2, value);
draw_text(x+2, y-framesAlive-2, value);
draw_text(x-2, y-framesAlive-2, value);
// Draw the white text (on top of everything before)
if (isBurnDamage)
	DrawSetText(c_yellow, fDamage, fa_center, fa_bottom);
else
	DrawSetText(c_white, fDamage, fa_center, fa_bottom);
draw_text(x, y-framesAlive, value);
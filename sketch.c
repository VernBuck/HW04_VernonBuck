#include "myLib.h"
#include "main.h"

//Player drawing function
//draws new player box and colors over old one
//adapted from recitation
void drawPlayer(PLAYERITEMS* p) {
	drawRect(p->oldRow, p->oldCol, p->height, p->width, BLACK);
	drawRect(p->row, p->col, p->height, p->width, p -> color);
}

// Draws box that gets hit
// if the box is erased than it is colored over in black
// written by me
void drawTarget(TARGETITEMS* t) {
	if (t -> erase == 1) {
		drawRect(t->row, t->col, t->height, t->width, BLACK);
	} else {
		drawRect(t->row, t->col, t->height, t->width, t -> color);
	}
}


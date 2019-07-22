#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, unsigned short color) {
	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
	//DMA[3]
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control) {
	// COMPLETE THIS FUNCTION !!
	// HINT: Look in myLib.h, in the DMA section
	DMA[channel].src = source;
	DMA[channel].dst = destination;
	DMA[channel].cnt = control | DMA_ON;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
	volatile unsigned short c = color;
	// You cannot use setPixel!!
	// Use the variable c instead of color in this function
	// COMPLETE THIS FUNCTION USING DMA!!
	for (int x = 0; x < height; x++) {
    	DMANow(3, &color, &videoBuffer[OFFSET(row + x, col, 240)], width | DMA_SOURCE_FIXED); 
	}
}

void fillScreen(unsigned short color) {
	volatile unsigned short c = color;
	// COMPLETE THIS FUNCTION USING DMA!!
	// you cannot use drawRect in this function.
	// You cannot use setPixel!!
	DMANow(3, &color, &videoBuffer[OFFSET(0,0, 240)], 38400 | DMA_SOURCE_FIXED | DMA_SOURCE_INCREMENT);
}

void waitForVblank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}
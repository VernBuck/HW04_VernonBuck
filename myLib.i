# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 26 "myLib.h"
extern unsigned short *videoBuffer;



void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void waitForVblank();
void fillScreen(unsigned short color);
# 51 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 61 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;
# 99 "myLib.h"
typedef struct
{
 int row;
 int col;
 int rdel;
 int cdel;
 int size;
 u16 color;
} MOVOBJ;
# 2 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;

void setPixel(int row, int col, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;

}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control) {


 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].cnt = control | (1 << 31);
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
 volatile unsigned short c = color;



 for (int x = 0; x < height; x++) {
     DMANow(3, &color, &videoBuffer[((row + x)*(240)+(col))], width | (2 << 23));
 }
}

void fillScreen(unsigned short color) {
 volatile unsigned short c = color;



 DMANow(3, &color, &videoBuffer[((0)*(240)+(0))], 38400 | (2 << 23) | (0 << 23));
}

void waitForVblank() {
 while(*(volatile u16 *)0x4000006 > 160);
 while(*(volatile u16 *)0x4000006 < 160);
}

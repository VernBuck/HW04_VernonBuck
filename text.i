# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"






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
# 8 "text.c" 2
# 1 "text.h" 1


extern const unsigned char fontdata_6x8[12288];


void drawChar(int row, int col, char ch, unsigned short color);
void drawString(int row, int col, char *str, unsigned short color);
# 9 "text.c" 2



void drawChar(int row, int col, char ch, unsigned short color)
{
 for(int r = 0; r < 8; r++) {
  for(int c = 0; c < 6; c++) {


   if(fontdata_6x8[((r)*(6)+(c)) + (ch*48)]) {
    setPixel(row + r, col + c, color);
   }
  }
 }
}


void drawString(int row, int col, char *str, unsigned short color)
{
    while (*str != '\0') {
     drawChar(row, col, *str, color);
     str++;
     col += 6;
 }
}

const unsigned char fontdata_6x8[12288] = {

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
# 90 "text.c"
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,0,0,1,1,
1,1,0,0,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,0,0,0,0,1,
1,0,1,1,0,1,
1,0,1,1,0,1,
1,0,0,0,0,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,1,1,1,
0,0,0,0,1,1,
0,0,1,1,0,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,0,0,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,1,1,0,1,1,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,0,0,
0,0,1,0,1,0,
0,0,0,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,1,1,1,1,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,1,1,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,1,1,
0,1,1,0,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,1,
0,1,1,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,1,1,
0,1,0,0,1,1,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,1,1,
0,1,0,1,0,1,
0,1,1,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,1,1,1,
0,1,0,1,0,1,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,1,1,1,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,0,0,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,1,0,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,1,0,1,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,1,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,0,1,0,
0,1,0,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,1,0,1,0,
0,1,0,1,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,0,1,1,
0,1,0,1,0,1,
0,0,0,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,

1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,
1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,0,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,0,0,0,
1,0,0,1,1,0,
1,0,0,0,0,1,
1,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,1,1,
0,1,1,0,0,1,
1,0,0,0,0,1,
0,0,0,0,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
1,1,0,0,1,0,
1,1,0,0,1,1,
1,1,1,1,1,0,
0,0,1,1,1,1,

0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
};

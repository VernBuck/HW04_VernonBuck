# 1 "sketch.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sketch.c"
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
# 2 "sketch.c" 2
# 1 "main.h" 1



void buildGame();
void goToStart();
void updateStart();
void initGame();
void goToGame();
void updateGame();
void goToPause();
void updatePause();
void goToWin();
void updateWin();
void goToLose();
void updateLose();


typedef struct {
 int row, oldRow;
 int col, oldCol;
 int rowDel;
 int colDel;
 int height;
 int width;
 int collisionChecked;
 unsigned short color;
} PLAYERITEMS;

typedef struct {
 int row;
 int col;
 int height;
 int width;
 int erase;
 unsigned short color;
} TARGETITEMS;
# 3 "sketch.c" 2




void drawPlayer(PLAYERITEMS* p) {
 drawRect(p->oldRow, p->oldCol, p->height, p->width, 0);
 drawRect(p->row, p->col, p->height, p->width, p -> color);
}




void drawTarget(TARGETITEMS* t) {
 if (t -> erase == 1) {
  drawRect(t->row, t->col, t->height, t->width, 0);
 } else {
  drawRect(t->row, t->col, t->height, t->width, t -> color);
 }
}

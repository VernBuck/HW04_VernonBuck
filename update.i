# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
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
void blockCount();


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
# 2 "update.c" 2
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
# 3 "update.c" 2
# 1 "update.h" 1

void updateBox(PLAYERITEMS* b);
int checkEdgeCollision(PLAYERITEMS* p);
void updatePlayer(PLAYERITEMS* b);
void collisionCheckObstaclePlayer(PLAYERITEMS* b, PLAYERITEMS* p);
int collisionCheckObstacleTarget(PLAYERITEMS* b, TARGETITEMS* p);
# 4 "update.c" 2







int gbaCollision(PLAYERITEMS* p) {
 if (160 < p->height + p->row + p->rowDel) {
  return 2;
 } else if(p-> col < 0) {
  return 3;
 } else if(240 < p->width + p->col+ p->colDel) {
  return 1;
 } else if(0 > p->row) {
  return 0;
 }
 return -1;
}




void updatePlayer(PLAYERITEMS* p) {

 p->oldRow = p->row;
 p->oldCol = p->col;

 if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
  if (p -> col < 240 - p -> width) {
   p->col++;
  }
 }
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
  if (p -> col > 0) {
   p->col--;
  }
 }
}



void collisionCheckObstaclePlayer(PLAYERITEMS* b, PLAYERITEMS* p)
{
 if(b->col <= p->col + p->width && b->col + b->width >= p->col && b->row + b->height >= p->row)
 {
  b->rowDel = -b -> rowDel;
 }
}


int collisionCheckObstacleTarget(PLAYERITEMS* b, TARGETITEMS* p)
{
 if (p -> erase != 1) {
  if(b->col <= p->col + p->width && b->col + b->width >= p->col && b->row + b->height >= p->row && b->row <= p ->row + p-> height) {
   b->rowDel = -b->rowDel;
   b -> colDel = -b->colDel;
   p -> erase = 1;
   return 1;
  }
 }
 return 0;
}



void updateBox(PLAYERITEMS* b) {

 b->oldRow = b->row;
 b->oldCol = b->col;


 b->row += b->rowDel;
 b->col += b->colDel;

 int edgeCollision = gbaCollision(b);

 if(edgeCollision == 0 || edgeCollision == 2) {
  b->rowDel = -b->rowDel;
  if (edgeCollision == 2) {


   goToLose();
  }
 } else if(edgeCollision == 1 || edgeCollision == 3) {
  b->colDel = -b->colDel;
 }

 b->collisionChecked = 0;
}

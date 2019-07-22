#define numItems 25

//Prototypes
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

//Structs
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
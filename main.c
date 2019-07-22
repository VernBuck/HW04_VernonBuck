#include "myLib.h"
#include "main.h"
#include "sketch.h"
#include "update.h"
#include <stdlib.h>
#include "text.h"

//objects that have movement attributes and control attributes made from structs
PLAYERITEMS paddle; 
PLAYERITEMS ball;

//Array of colors randomly assigned to blocks
unsigned short color[] = {RED, BLUE, GREEN, WHITE, YELLOW};

//objects that are not mobile and can be terminated
TARGETITEMS targets[numItems];

// The number of blocks left to go
int numBlocks = numItems;

//different buffers for different states of the game!
char buffer[41];
char buffer2[41];
char buffer3[41];
char buffer4[41];
char buffer5[41];
int oldBlocks;

//game states for state machine
int state;
enum { STARTSCREEN, GAMESCREEN, LOSESCREEN, WINSCREEN, PAUSESCREEN };

//buttons used to traverse through game state (otherwise these are not needed)
unsigned int buttons;
unsigned int oldButtons;

//creates the game and holds different states at different times for it
int main() {
	buildGame();
	goToStart();

	while (1) {
		oldButtons = buttons;
        buttons = BUTTONS;
		switch(state) {
        	case STARTSCREEN:
        		updateStart();
        		break;
        	case GAMESCREEN:
        		updateGame();
        		break;
        	case LOSESCREEN:
        		updateLose();
        		break;
        	case WINSCREEN:
        		updateWin();
        		break;
        	case PAUSESCREEN:
        		updatePause();
        		break;
        }
	}
}
//Note current state manipulated by enum (number), in each case, update is where the user starts and an action transfers 
// the person to another state
void goToStart() {
	fillScreen(BLUE);
	state = STARTSCREEN;
}

void updateStart() {
	drawString(80, 60, buffer3, GREEN);
	sprintf(buffer3, "PRESS START TO PLAY!"); 
	if(BUTTON_PRESSED(BUTTON_START)) {
		buildGame();
		goToGame();
	}
}

void goToGame() {
	fillScreen(BLACK);
	state = GAMESCREEN;
}

void updateGame() {
    update();
    waitForVblank();
    sketch();
    if(BUTTON_PRESSED(BUTTON_START)) {
    	goToPause();
    }
    if(numBlocks == 0) {
    	goToWin();
    }
}

void goToPause() {
	state = PAUSESCREEN;
}

void updatePause() {
	drawString(80, 60, buffer4, GREEN);
	sprintf(buffer4, "PRESS START TO RESUME!"); 
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart();
	}
}

void goToLose() {
	fillScreen(RED);
	state = LOSESCREEN;
}

void updateLose() {
	drawString(100, 80, buffer5, BLACK);
	sprintf(buffer5, "YOU LOSE!"); 
     if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}

void goToWin() {
	fillScreen(YELLOW);
	state = WINSCREEN;
}

void updateWin() {
	drawString(80, 100, buffer2, GREEN);
	sprintf(buffer2, "YOU WIN!");    
}

//sets up game
void buildGame() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	//initialize green ball location
	ball.row = 100;
	ball.col = 120;
	//initializes initial directional movement
	ball.rowDel = 1;
	ball.colDel = 1;
	//initializes ball size
	ball.width = 10;
	ball.height = 10;
	ball.color = GREEN;

	//initialize paddle
	paddle.row = 150;
	paddle.col = 120;
	paddle.rowDel = 0;
	paddle.colDel = 0;
	paddle.width = 30;
	paddle.height = 8;
	paddle.color = BLUE;

	//initialize target items! 
		for(int i = 0; i <= numItems; i++) {
			if(i <= 5){
				targets[i].row = 0;
				targets[i].col = (30*i);
				targets[i].width = 30;
				targets[i].height = 5;
				targets[i].color = color[rand()%5];
			} else if(i <= 10) {
				targets[i].row = 20;
				targets[i].col = (30*(i-5));
				targets[i].width = 30;
				targets[i].height = 5;
				targets[i].color = color[rand()%5];
			} else if(i <= 15) {
				targets[i].row = 40;
				targets[i].col = (30*(i-10));
				targets[i].width = 30;
				targets[i].height = 5;
				targets[i].color = color[rand()%5];
			} else if(i <= 20){
				targets[i].row = 60;
				targets[i].col = (30*(i-15));
				targets[i].width = 30;
				targets[i].height = 5;
				targets[i].color = color[rand()%5];
			} else {
				targets[i].row = 80;
				targets[i].col = (30*(i-20));
				targets[i].width = 30;
				targets[i].height = 5;
				targets[i].color = color[rand()%5];
			}
		}
	}

void update() {
	//changes the paddle via movements and green square via its movements
	updatePlayer(&paddle);
	updateBox(&ball);

	//This code uses boolean statements to test whether or not a block is destroyed and it alters the number of blocks based on that
	//This also performs a check to see the numBlock and oldBlock boolean
	collisionCheckObstaclePlayer(&ball, &paddle);
	//if (collisionCheckObstacleTarget(&ball, &target1) == 1 | collisionCheckObstacleTarget(&ball, &target2) == 1 | collisionCheckObstacleTarget(&ball, &target3) == 1) {
	for (int i = 0; i < numItems; i++) {
		if(collisionCheckObstacleTarget(&ball, &targets[i]) == 1) {
			numBlocks--;
			blockCount();
		}
	}
}

//keeps track of oldBlock variable, when the oldBlock and numBlock are the same nothing happens
//however, when they are different a black square is drawn over the old printed block count
void blockCount() {
	if(oldBlocks == numBlocks) {
		return;
	} 
	oldBlocks = numBlocks;
	drawRect(100,130,20,20,BLACK);
}

//calls sketch method using the parameters set in buildGame method
void sketch() {
	drawPlayer(&paddle);
	for(int i = 0; i < numItems; i++) {
		drawTarget(&targets[i]);
	}
	drawPlayer(&ball);
	sprintf(buffer, "# of blocks:  %d", numBlocks);
	drawString(100, 50, buffer, RED);
}
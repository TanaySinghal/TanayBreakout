/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17689*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

//This is an alteration of the code for "Breakout" by Steph Thirion.
//Tweaked by Tanay Singhal on 01/16/2015
 
Rectangle gameFrame;
Brick[] bricks;
Paddle paddle;
Ball ball;

int score;

void setup() {
  size(700, 700);
  background(0, 150, 0);
  rectMode(CORNER);
  ellipseMode(CORNER);
  
  createBricks();
  createBall();
  paddle = new Paddle(150,20); //width, height
  textAlign(CENTER,CENTER);
  
  score = 0;
}

void draw() {
  refreshScreen();
  getscore();
}

void createBall() {
  ball = new Ball(100, 500);
}

void createBricks() {
  // BRICK GROUP PROPERTIES --
  int brickCount = 60;
  int bricksPerRow = 10;
  int brickWidth = width/bricksPerRow;
  int brickHeight = 50;
  int brickY = 50;
  
  color[] rowsColors = {
    color(100,0,180), //purple
    color(0,0,255), //blue
    color(0,255,0), //green
    color(255,255,0), //yellow
    color(255,127,0), //orange
    color(255,0,0) //red
  };
  
  // CREATE BRICKS --
  bricks = new Brick[brickCount];
  for (int i=0; i < brickCount; i++) {
    int rowNum = (int) (i/bricksPerRow); // 1/10 = 0.1
    
    // location
    int x = brickWidth*i;
    x -= rowNum*bricksPerRow*brickWidth;
    int y = brickY + (int)(i/bricksPerRow)*brickHeight;
    
    // color
    int num = min(rowNum, rowsColors.length-1);
    color rowColor = rowsColors[num];
    
    // create brick
    bricks[i] = new Brick(x, y, brickWidth, brickHeight, rowColor);
  }
}

void refreshScreen() {
  background(0);

  ball.refresh();
  paddle.refresh();
  for (int i=0; i<bricks.length; i++) {
    bricks[i].refresh();
  }
}

void getscore() {
  fill(255);
  text("Score: " + score,width/2,25);
}

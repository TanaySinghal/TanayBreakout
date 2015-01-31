public class Brick {
  Rectangle rectangle;
  int x = width/2, y = 270;
  boolean alive;
  
  Brick(int X, int Y, int W, int H, color FILL) {
    rectangle = new Rectangle(W, H, FILL);
    rectangle.setPosition(X, Y);
    alive = true;
  }
   
  void refresh(){
    if (alive) rectangle.drawYourself();
  }
  
  void die() {
    alive = false;
    score ++;
  }
}


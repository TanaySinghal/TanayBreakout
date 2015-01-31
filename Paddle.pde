public class Paddle {
  Rectangle rectangle;
  // PADDLE PROPERTIES --
  int w, h;
  int x = width/2, y = height-50;
  
  Paddle(int W, int H) {
    w = W;
    h = H;
    rectangle = new Rectangle(w, h, color(255,255,0));
    rectangle.setPosition(x, y);
  }
  
  void refresh(){
    //paddle follows mouse
    x = mouseX - w/2;
    //don't allow paddle to go off screen
    x = constrain(x, 0, width-w);
    rectangle.setPosition(x, y);
    rectangle.drawYourself();
  }
}


import java.awt.geom.*;

public class Rectangle {
  int x1, y1, x2, y2;
  int w, h;
  color fillColor;
  
  Rectangle(int W, int H, color FILL) {
    w  = W;
    h = H;
    fillColor = FILL;
  }
   
  void setPosition(int X, int Y) {
    x1 = X;
    y1 = Y;
    x2 = x1 + w ;
    y2 = y1 + h;
  }
   
  void drawYourself(){
    fill(fillColor);
    rect(x1, y1, w , h);
  }
  
  // COLLISION DETECTION FUNCTIONS
  boolean doesPointTouchMe (int PX, int PY){
    if (PX >= x1 && PX <= x2 && PY >= y1 && PY <= y2) {
        return true;
    }
    
    return false;
  }  
    
  int whatSideDoesLineTouch (Line2D LINE, int VELX, int VELY){
      Line2D side;
      // top (1) / bottom (3)
      if (VELY>0){
        side = new Line2D.Float(x1,y1,x2,y1);
        if(LINE.intersectsLine(side)){
          return 1;
        }
      } else if (VELY<0){
        side = new Line2D.Float(x1,y2,x2,y2);
        if(LINE.intersectsLine(side)){
          return 3;
        }
      }
      // left (4) / right (2)
      if (VELX>0){
        side = new Line2D.Float(x1,y1,x1,y2);
        if(LINE.intersectsLine(side)){
          return 4;
        }
      } else if (VELX<0){
        side = new Line2D.Float(x2,y1,x2,y2);
        if(LINE.intersectsLine(side)){
          return 2;
        }
      }
      return 0;
  }
}

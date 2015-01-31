import java.awt.geom.*;

public class Ball {

  Rectangle rectangle;
  // BALL PROPERTIES --
  int w  = 30;
  int h = 30;
  int velX = 3, velY = 3;
  int x, y, ox, oy, xcentre, ycentre;

  Ball(int X, int Y) {
    x = X;
    y = Y;
    rectangle = new Rectangle( w, h, color(255));
    rectangle.setPosition(x, y);
  }

  void refresh() {
    updatePosition();
    rectangle.setPosition(x, y);

    fill(255);
    ellipse(x, y, w, h);
  }

  void updatePosition() {
    // add velocity to position
    x += velX;
    y += velY;
    // bounce off wall
    if (x <= 0 || x >= width - w ) {
      velX = -velX;
    }
    if (y <= 0) {
      velY = -velY;
    } else if (y >= height - h) {
      setup();
    }

    xcentre = x + w/2;
    ycentre = y + h/2;
    // collision with paddle
    int result = checkCollisionWithRectangle(paddle.rectangle);
    // if collides on top, control direction of ball
    if (result == 1 && xcentre < paddle.rectangle.x1 + paddle.rectangle.w/2) {
      velX = -velX;
    }

    // collision with bricks
    if (result == 0) {
      for (int i=0; i<bricks.length; i++) {
        if (bricks[i].alive && checkCollisionWithRectangle(bricks[i].rectangle) != 0) {
          bricks[i].die();
          break;
        }
      }
    }
    ox = x;
    oy = y;
  }

  // Detect collision
  // result: 0: no collision 1: top 2: right 3: bottom 4: left 5: couldn't detect which side
  int checkCollisionWithRectangle (Rectangle R) {
    int result = 0;
    if (R.doesPointTouchMe(xcentre, ycentre)) {
      // which side did it collide
      //Line2D lineaBola = new Line2D.Float(xcentre, ycentre, ox + w/2, oy + h/2);

      //This line is causing problems.. Line2D.Float
            
      result = R.whatSideDoesLineTouch(new Line2D.Float(xcentre, ycentre, ox + w/2, oy + h/2), velX, velY);

      switch(result) {
      case 1: //top 
        velY = -velY;      
        y = R.y1- h;
        break;
      case 2: //right
        velX = -velX;
        x = R.x2;
        break;
      case 3: //bottom
        velY = -velY;
        y = R.y2;
        break;
      case 4: //bottom
        velX = -velX;
        x = R.x1 - w;
        break;
      default: 
        result = 5;
        break;
      }
    }
    return result;
  }
}


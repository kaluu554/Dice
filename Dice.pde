int sum = 0;
int rolls = 0;
void setup()
{
  size(500, 500);
  rectMode(CENTER);
  noLoop();
  noStroke();
  textSize(25);
  textAlign(CENTER);
}
void draw()
{
  background(#E0D6FF);
  for (int y = 30; y<450; y+=55) {
    for (int x = 30; x<500; x+=55) {
      Die one = new Die(x, y);
      one.roll();
      one.show();
    }
  }
  rolls += 1;
  fill(0);
  text("Total Rolls: " + rolls, 350,480);
  text("Dots: " + sum, 150,480);
  sum = 0;
  
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  int myX, myY, mySize, dot;

  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
    mySize = 50;
  }
  void roll()
  {
    dot = (int)(Math.random()*6)+1;

  }
  void show()
  {
    //random colors
    int col1 = (int)(Math.random()*150)+120;
    int col2 = (int)(Math.random()*150)+120;
    int col3 = (int)(Math.random()*150)+120;
    fill(255);
    //die base
    rect(myX, myY, mySize, mySize, 15);
    fill(col1,col2,col3);
    //condition for dots
    if (dot == 1) {
      ellipse(myX, myY, 10, 10);
      sum = sum + 1;
    } else if (dot == 2) {
      ellipse(myX-10, myY-10, 10, 10);
      ellipse(myX+10, myY+10, 10, 10);
      sum = sum + 2;
    } else if (dot == 3) {
      ellipse(myX+10, myY-10, 10, 10);
      ellipse(myX-10, myY+10, 10, 10);
      ellipse(myX, myY, 10, 10);
      sum = sum + 3;
    } else if (dot == 4) {
      ellipse(myX-10, myY-10, 10, 10);
      ellipse(myX+10, myY+10, 10, 10);
      ellipse(myX+10, myY-10, 10, 10);
      ellipse(myX-10, myY+10, 10, 10);
      sum = sum + 4;
    } else if (dot == 5) {
      ellipse(myX-10, myY-10, 10, 10);
      ellipse(myX+10, myY+10, 10, 10);
      ellipse(myX+10, myY-10, 10, 10);
      ellipse(myX-10, myY+10, 10, 10);
      ellipse(myX, myY, 10, 10);
      sum = sum + 5;
    } else {
      ellipse(myX-8, myY-12, 10, 10);
      ellipse(myX+8, myY+12, 10, 10);
      ellipse(myX+8, myY-12, 10, 10);
      ellipse(myX-8, myY+12, 10, 10);
      ellipse(myX-8, myY, 10, 10);
      ellipse(myX+8, myY, 10, 10);
      sum = sum + 6;
    }
    
  }//end of show()
}

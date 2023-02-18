private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = 0.55;
private int num = 0;
private boolean die = false;
public void setup()
{
  size(700, 700);
  //noLoop();
  frameRate(25);
}

public void draw()
{
  background(#A7DCF0);
  stroke(#676262);
  line(350, 700, 350, 500);
  stroke(#057E81);
  drawBranches(350, 500, num, 3*Math.PI/2);  //will add later
  if (die == false) {
    if (num == 151) {
      die = true;
    }
    if (num <= 150) {
      num++;
    }
  }
  if (die == true){
    if(num==0){
      die=false;
   }
    if(num > 0){
      num--;
   }
  }
}
public void drawBranches(int x, int y, double branchLength, double angle)
{
  //your code here
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;

  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
}

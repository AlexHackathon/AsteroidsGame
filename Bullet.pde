class Bullet extends Floater{
  private boolean active = true;
  public Bullet(Spaceship theShip){
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    myXspeed = 5 * Math.cos(myPointDirection*(Math.PI/180));
    myYspeed = 5 * Math.sin(myPointDirection*(Math.PI/180));
    corners = 2;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = 0;
    xCorners[1] = (int)(10*Math.cos(myPointDirection*(Math.PI/180)));
    yCorners[1] = (int)(10*Math.sin(myPointDirection*(Math.PI/180)));
    myColor = color(255,255,255);
  }
  public boolean Offscreen(){
    if((myCenterX > 400 || myCenterX < 0) || (myCenterX > 400 || myCenterX < 0)){
      return true;
    }
    return false;
  }
  public void show(){
    line((float)myCenterX,(float)myCenterY, (float)myCenterX + 10*(float)Math.cos(myPointDirection*(Math.PI/180)),(float)myCenterY + 10*(float)Math.sin(myPointDirection*(Math.PI/180)));
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}

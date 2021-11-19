class Bullet extends Floater{
  private boolean active;
  public Bullet(Spaceship theShip){
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    myXspeed = 5 * Math.cos(myPointDirection*(Math.PI/180));
    myYspeed = 5 * Math.cos(myPointDirection*(Math.PI/180));
    corners = 2;
    xCorners = new int[2];
    yCorners = new int[2];
    xCorners[0] = 0;
    yCorners[0] = 0;
    xCorners[1] = (int)(10*Math.cos(myPointDirection*(Math.PI/180)));
    yCorners[1] = (int)(10*Math.sin(myPointDirection*(Math.PI/180)));
    myColor = color(255,255,255);
    active = true;
  }
  public void Offscreen(){
    if((myCenterX > 400 || myCenterX < 0) || (myCenterX > 400 || myCenterX < 0)){
      active = false;
    }
  }
  public boolean getActive(){
    return active;
  }
}

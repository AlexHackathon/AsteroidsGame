class Spaceship extends Floater{
  private boolean dead;
  private int framesBetweenShoot;
  private int currFrames;
  private int health;
  public Spaceship(float x, float y){
    health = 3;
    corners = 4;
    framesBetweenShoot = 20;
    xCorners = new int[]{10,-5,0,-5};
    yCorners = new int[]{0,5,0,-5};
    myColor = color(255,255,255);
    myCenterX = x;
    myCenterY = y;
    myXspeed = 1;
    myYspeed = 0;
    myPointDirection = 0;
    dead = false;
  }
  public void Hyperspace(){
    myCenterX = (float)Math.random() * 400;
    myCenterY = (float)Math.random() * 400;
    myPointDirection = (float)(Math.random() * 360);
    myXspeed = 0;
    myYspeed = 0;
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public boolean getDead(){
    return dead;
  }
  public void die(){
    dead = true;
  }
  public double getPointDirection(){
    return myPointDirection;
  }
  public boolean canShoot(){
    if(currFrames >= framesBetweenShoot){
      return true;
    }
    return false;
  }
  public void setCurrFrames(int frames){
    currFrames = frames;
  }
  public int getCurrFrames(){
    return currFrames;
  }
  private void decreaseHealth(int decrease){
    health -= decrease;
  }
  private int getHealth(){
    return health;
  }
}

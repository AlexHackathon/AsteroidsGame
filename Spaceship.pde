class Spaceship extends Floater{
  private ArrayList<Bullet> bullets;
  private boolean dead;
  public Spaceship(float x, float y){
    corners = 4;
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
}

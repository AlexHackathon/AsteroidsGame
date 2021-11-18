class Asteroid extends Floater{
  private double rotSpeed;
  private float radius;
  public Asteroid(int halfRadius){
    corners = 8;
    radius = 2 * halfRadius;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = halfRadius + (int)(Math.random() * halfRadius);
    yCorners[0] = (int)(Math.random() * halfRadius);
    xCorners[1] = (int)(Math.random() * halfRadius);
    yCorners[1] = halfRadius + (int)(Math.random() * halfRadius);
    xCorners[2] = -(int)(Math.random() * halfRadius);
    yCorners[2] = halfRadius + (int)(Math.random() * halfRadius);
    xCorners[3] = -(halfRadius + (int)(Math.random() * halfRadius));
    yCorners[3] = (int)(Math.random() * halfRadius);
    xCorners[4] = -(halfRadius + (int)(Math.random() * halfRadius));
    yCorners[4] = -(int)(Math.random() * halfRadius);
    xCorners[5] = -(int)(Math.random() * halfRadius);
    yCorners[5] = -(halfRadius + (int)(Math.random() * halfRadius));
    xCorners[6] = (int)(Math.random() * halfRadius);
    yCorners[6] = -(halfRadius + (int)(Math.random() * halfRadius));
    xCorners[7] = halfRadius + (int)(Math.random() * halfRadius);
    yCorners[7] = -(int)(Math.random() * halfRadius);
    myColor = color(255,255,255);
    myCenterX = Math.random() * 400;
    myCenterY = Math.random() * 400;
    myPointDirection = Math.random() * 360;
    myXspeed = 1 + Math.random() * 2 * Math.cos(myPointDirection);
    myYspeed = 1 + Math.random() * 2 * Math.sin(myPointDirection);
  }
  public void move(){
    turn(rotSpeed);
    super.move();
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public float getRadius(){
    return radius;
  }
  public void setRadius(float r){
    radius = r;
  }
}

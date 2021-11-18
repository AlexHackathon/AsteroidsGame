class Asteroid extends Floater{
  double rotSpeed;
  public Asteroid(){
    
  }
  public void move(){
    turn(rotSpeed);
    super.move();
  }
}

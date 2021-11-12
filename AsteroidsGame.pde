Spaceship spaceship;
boolean turnLeft = false;
boolean turnRight = false;
boolean boosting = false;
void setup(){
  spaceship = new Spaceship(200,200,0,.25,PI/60);
  size(400,400);
}
void draw(){
  //Setup
  background(0,0,0);
  stroke(255,255,255);
  
  //Input check
  //Make sure you don't rotate while moving
  if(boosting){
    spaceship.Boost(1);
    if(turnLeft){
      spaceship.setDir(1);
      spaceship.setAngleSpeed(PI/60);
      spaceship.Turn();
    } else if(turnRight){
      spaceship.setDir(-1);
      spaceship.setAngleSpeed(PI/60);
      spaceship.Turn();
    } else {
      spaceship.setDir(0);
    }
  } else{
    spaceship.Move(.2);
    if(turnLeft){
      spaceship.setDir(1);
      spaceship.setAngleSpeed(PI/60);
      spaceship.Turn();
    } else if(turnRight){
      spaceship.setDir(-1);
      spaceship.setAngleSpeed(PI/60);
      spaceship.Turn();
    } else {
      spaceship.setAngleSpeed(PI/400);
      spaceship.Turn();
    }
  }
  spaceship.Show();
  spaceship.MoveBullets();
  //spaceship.Move();
  if(spaceship.getX() > 400 || spaceship.getY() > 400){
    spaceship.Relocate(400,400);
  } else if(spaceship.getX() < 0 || spaceship.getY() < 0){
    spaceship.Relocate(400,400);
  }
}
void keyPressed(){
  if(key == ' '){
    spaceship.Shoot();
  }
  if(key == 'w'){
    boosting = true;
  }
  if(key == 'a'){
    turnLeft = true;
  }
  if(key == 'd'){
    turnRight = true;
  }
}
void keyReleased(){
  if(key == 'w'){
    boosting = false;
  }
  if(key == 'a'){
    turnLeft = false;
  }
  if(key == 'd'){
    turnRight = false;
  }
}
class Floater{
  protected float x,y,facingAngle,speedAngle,speed,angleSpeed;
  private int dir;
  protected Point[] verticies;
  public Floater(float posX, float posY, float fA,float s, Point[] p, float aS){
    dir = 0;
    verticies = p;
    x = posX;
    y = posY;
    facingAngle = fA;
    speedAngle = fA;
    speed = s;
    angleSpeed = aS;
  }
  public void Move(float s){
    speed = s;
    x += speed * Math.cos(speedAngle);
    y -= speed * Math.sin(speedAngle);
  }
  public void Turn(){
    facingAngle += angleSpeed * dir;
  }
  public int getDir(){
    return dir;
  }
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getFacingAngle(){
    return facingAngle;
  }
  public void setAngleSpeed(float a){
    angleSpeed = a;
  }
  public void setDir(int d){
    dir = d;
  }
  public void Show(){
   stroke(255,255,255);
   translate(x,y);
   rotate(-facingAngle);
   for(int i = 0; i < verticies.length; i++){
     if(i < verticies.length-1){
        line(verticies[i].getX(), verticies[i].getY(), verticies[i+1].getX(), verticies[i+1].getY());
     } else {
       line(verticies[i].getX(), verticies[i].getY(), verticies[0].getX(), verticies[0].getY());
     }
   }
   rotate(facingAngle);
   translate(-x,-y);
  }
  public void Relocate(int screenWidth, int screenHeight){
    int screenMidX = screenWidth / 2;
    int screenMidY = screenHeight / 2;
    
    float difX = x - screenMidX;
    float difY = y - screenMidY;
    
    x -= (2 * difX - 10);
    y -= (2 * difY + 10);
    if(x > screenWidth){
      x = screenWidth - 1;
    } else if(x < 0){
      x= 1;
    }
    if(y > screenHeight){
      y = screenHeight - 1;;
    } else if(y < 0){
      y = 1;
    }
  }
}
class Spaceship extends Floater{
  private ArrayList<Bullet> bullets;
  Spaceship(float x, float y, float a, float s, float aS){
    super(x,y,a,s,new Point[]{new Point(10,0),new Point(-5,5),new Point(0,0),new Point(-5,-5)},aS);
    bullets = new ArrayList<Bullet>();
  }
  public void MoveBullets(){
    for(int i = 0; i < bullets.size();){
      bullets.get(i).Move(3);
      bullets.get(i).Show();
      bullets.get(i).Offscreen();
      if(!bullets.get(i).active){
        bullets.remove(i);
      } else {
        i++;
      }
    }
  }
  public void Shoot(){
    bullets.add(new Bullet(x,y,facingAngle,4));
  }
  public void Boost(int s){
    speed = s;
    speedAngle = facingAngle;
    Move(speed);
  }
}
class Bullet extends Floater{
  boolean active;
  Bullet(float x, float y, float a, float s){
    super(x,y,a,s,new Point[]{new Point(0,0), new Point(10,0)},0);
    active = true;
  }
  void Offscreen(){
    if((this.getX() > 400 || this.getX() < 0) || (this.getY() > 400 || this.getY() < 0)){
      active = false;
    }
  }
}
class Asteroid extends Floater{
  Asteroid(float x, float y, float a, float s, float aS){
    super(x,y,a,s,null,aS);
  }
}
class Point{
  private float myX;
  private float myY;
  public Point(float x, float y){
    myX = x;
    myY = y;
  }
  public float getX(){
    return myX;
  }
  public float getY(){
    return myY;
  }
  public float getDist(Point p1, Point p2){
    return (float)sqrt((float)Math.pow(p2.getX() - p1.getX(),2) + (float)Math.pow(p2.getY() - p1.getY(),2));
  }
}

Star[] stars;
Spaceship spaceship;
boolean turnLeft = false;
boolean turnRight = false;
boolean boosting = false;
boolean decelerating = false;
void setup(){
  stars = new Star[200];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  spaceship = new Spaceship(200,200);
  size(400,400);
}
void draw(){
  background(0,0,0);
  stroke(255,255,255);
  for(int i = 0; i < stars.length; i++){
    stars[i].Show();
  } 
  if(boosting){
    spaceship.accelerate(.1);
  } else if(decelerating){
    spaceship.accelerate(-.1);
  }
  if(turnRight){
    spaceship.turn(3);
  } else if(turnLeft){
    spaceship.turn(-3);
  }
  spaceship.show();
  //spaceship.MoveBullets();
  spaceship.move();
  //spaceship.turn();
  //spaceship.Relocate(400,400);
}
void keyPressed(){
  if(key == ' '){
    spaceship.Shoot();
  }
  if(key == 'w'){
    boosting = true;
  } else if(key == 's'){
    decelerating = true;
  }
  if(key == 'a'){
    turnLeft = true;
  } else if(key == 'd'){
    turnRight = true;
  }
  if(key == 'h'){
    spaceship.Hyperspace();
  }
}
void keyReleased(){
  if(key == 'w'){
    boosting = false;
  } else if(key == 's'){
    decelerating = false;
  }
  if(key == 'a'){
    turnLeft = false;
  } else if(key == 'd'){
    turnRight = false;
  }
}
/*
class Floater{
  protected float x,y,facingAngle,speedAngle,speed,angleSpeed;
  protected Point[] verticies;
  public Floater(float posX, float posY, float fA,float s, Point[] p, float aS){
    verticies = p;
    x = posX;
    y = posY;
    facingAngle = fA;
    speedAngle = fA;
    speed = s;
    angleSpeed = aS;
  }
  public void Move(){
    x += speed * Math.cos(speedAngle);
    y -= speed * Math.sin(speedAngle);
  }
  public void Turn(){
    facingAngle += angleSpeed;
    println(facingAngle);
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
  public float getAngleSpeed(){
    return angleSpeed;
  }
  public void setAngleSpeed(float a){
    angleSpeed = a;
  }
  public void setSpeed(float s){
    speed = s;
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
}*/
/*class Spaceship extends Floater{
  private ArrayList<Bullet> bullets;
  Spaceship(float x, float y, float a, float s, float aS){
    super(x,y,a,s,new Point[]{new Point(10,0),new Point(-5,5),new Point(0,0),new Point(-5,-5)},aS);
    bullets = new ArrayList<Bullet>();
  }
  public void MoveBullets(){
    for(int i = 0; i < bullets.size();){
      bullets.get(i).Move();
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
    Bullet b = new Bullet(x,y,facingAngle,4);
    b.setSpeed(3);
    bullets.add(b);
    
  }
  public void Boost(){
    if(speed < 1f && speed > -1f){
      speed += 1;
    }
    speedAngle = facingAngle;
  }
  public void Hyperspace(){
    x = (float)Math.random() * 400;
    y = (float)Math.random() * 400;
    facingAngle = (float)Math.random() * 2*PI;
    angleSpeed = 0;
    speed = 0;
    speedAngle = facingAngle;
  }
}*/
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

Spaceship spaceship;
boolean turnLeft = false;
boolean turnRight = false;
boolean boosting = false;
void setup(){
  spaceship = new Spaceship(200,200,0,.25);
  size(400,400);
}
void draw(){
  //Setup
  background(0,0,0);
  stroke(255,255,255);
  
  //Input check
  if(turnLeft){
    spaceship.Turn(-PI/60);
  } else if(turnRight){
    spaceship.Turn(PI/60);
  } else {
    
  }
  if(boosting){
    spaceship.Boost(1);
  } else{
    spaceship.Move(.2);
  }
  spaceship.Show();
  spaceship.MoveBullets();
  //spaceship.Move();
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
  protected float x,y,facingAngle,speedAngle,speed;
  protected Point[] verticies;
  public Floater(float posX, float posY, float fA,float s, Point[] p){
    verticies = p;
    x = posX;
    y = posY;
    facingAngle = fA;
    speedAngle = fA;
    speed = s;
  }
  public void Move(float s){
    speed = s;
    x += speed * Math.cos(speedAngle);
    y -= speed * Math.sin(speedAngle);
  }
  public void Turn(float a){
    facingAngle += a;
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
}
class Spaceship extends Floater{
  private ArrayList<Bullet> bullets;
  Spaceship(float x, float y, float a, float s){
    super(x,y,a,s,new Point[]{new Point(10,0),new Point(-5,5),new Point(0,0),new Point(-5,-5)});
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
    super(x,y,a,s,new Point[]{new Point(0,0), new Point(10,0)});
    active = true;
  }
  /*void Show(){
    float a = 10*(float)Math.cos(this.getFacingAngle());
    float b = 10*(float)Math.sin(this.getFacingAngle());
    line(this.getX(),this.getY(),this.getX()-a,this.getY() + b);
  }*/
//void Show(){
    //verticies[1] = new Point(10*(float)Math.cos(facingAngle),10*(float)Math.sin(facingAngle));
    //super.Show();
  //}
  void Offscreen(){
    if((this.getX() > 400 || this.getX() < 0) || (this.getY() > 400 || this.getY() < 0)){
      active = false;
    }
  }
}
class Asteroid extends Floater{
  Asteroid(float x, float y, float a, float s){
    super(x,y,a,s,null);
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

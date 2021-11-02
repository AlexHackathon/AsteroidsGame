Spaceship spaceship;
void setup(){
  spaceship = new Spaceship(200,200,0,2);
  size(400,400);
}
void draw(){
  background(0,0,0);
  stroke(255,255,255);
  spaceship.MoveBullets();
}
void keyPressed(){
  if(key == ' '){
    spaceship.Shoot();
  }
  if(key == 'w'){
    spaceship.Boost();
  }
}
class Floater{
  private float x,y,facingAngle,speedAngle,speed;
  public Floater(float posX, float posY, float fA,float s){
    x = posX;
    y = posY;
    facingAngle = fA;
    speedAngle = fA;
    speed = s;
  }
  public void Move(){
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
}
class Spaceship extends Floater{
  private ArrayList<Bullet> bullets;
  Spaceship(float x, float y, float a, float s){
    super(x,y,a,s);
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
    bullets.add(new Bullet(this.getX(),this.getY(),this.getFacingAngle(),4));
  }
  public void Show(){
  
  }
  public void Move(){
    
  }
  public void Boost(){
    
  }
}
class Bullet extends Floater{
  boolean active;
  Bullet(float x, float y, float a, float s){
    super(x,y,a,s);
    active = true;
  }
  void Show(){
    float a = 10*(float)Math.cos(this.getFacingAngle());
    float b = 10*(float)Math.sin(this.getFacingAngle());
    line(this.getX(),this.getY(),this.getX()-a,this.getY() + b);
  }
  void Offscreen(){
    if((this.getX() > 400 || this.getX() < 0) || (this.getY() > 400 || this.getY() < 0)){
      active = false;
    }
  }
}
class Asteroid extends Floater{
  Asteroid(float x, float y, float a, float s){
    super(x,y,a,s);
  }
}

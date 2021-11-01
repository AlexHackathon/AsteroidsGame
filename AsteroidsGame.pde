ArrayList<Bullet> bullets = new ArrayList<Bullet>();
public void setup(){
  size(400,400);
  bullets.add(new Bullet(200,200,PI/4,4));
}
public void draw(){
  background(0,0,0);
  stroke(255,255,255);
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
class Floater{
  float x,y,angle,speed;
  Floater(float posX, float posY, float a, float s){
    x = posX;
    y = posY;
    angle = a;
    speed = s;
  }
  void Move(){
    x += speed * Math.cos(angle);
    y -= speed * Math.sin(angle);
  }
  void Turn(float a){
    angle += a;
  }
}
class Spaceship extends Floater{
  Spaceship(float x, float y, float a, float s){
    super(x,y,a,s);
  }
}
class Bullet extends Floater{
  boolean active;
  Bullet(float x, float y, float a, float s){
    super(x,y,a,s);
    active = true;
  }
  void Show(){
    float a = 10*(float)Math.cos(angle);
    float b = 10*(float)Math.sin(angle);
    line(x,y,x-a,y + b);
  }
  void Offscreen(){
    if((x > 400 || x < 0) || (y > 400 || y < 0)){
      active = false;
    }
  }
}
class Asteroid extends Floater{
  Asteroid(float x, float y, float a, float s){
    super(x,y,a,s);
  }
}

//To Do: bullets don't work because they get relocated before it realizes that they are off the screen;
Star[] stars;
Spaceship spaceship;
ArrayList<Bullet> bullets;
boolean turnLeft = false;
boolean turnRight = false;
boolean boosting = false;
boolean decelerating = false;
ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
void setup(){
  size(400,400);
  bullets = new ArrayList<Bullet>();
  stars = new Star[200];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  spaceship = new Spaceship(200,200);
  for(int i = 0; i < 5; i++){
    asteroidList.add(new Asteroid(10));
  }
}
void draw(){
  background(0,0,0);
  stroke(255,255,255);
  //Show stars
  for(int i = 0; i < stars.length; i++){
    stars[i].Show();
  }
  //Check if dead and leave if true
  if(spaceship.getDead()){
    fill(255,255,255);
    textAlign(CENTER);
    text("Game Over",200,200);
    return;
  }
  //Dp things based on inputs
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
  spaceship.move();
  //Move and show asteroids
  for(Asteroid a : asteroidList){
    a.move();
    a.show();
  }
  //Remove asteroids when hit by spaceship
  for(int i = 0; i < asteroidList.size();){
    Asteroid a = asteroidList.get(i);
    float dist = (float)dist((float)a.getX(), (float)a.getY(), (float)spaceship.getX(), (float)spaceship.getY());
    if(dist < a.getRadius()){
      asteroidList.remove(i);
      spaceship.die();
    } else {
       i++;
    }
  }
  //Move Bullets
  for(int i = 0; i < bullets.size();){
    if(bullets.get(i).Offscreen()){
      bullets.remove(i);
      println("Hi");
    } else {
      bullets.get(i).move();
      bullets.get(i).show();
      i++;
    }
  }
  //Check if bullets hit asteroids and remove asteroid
  for(int i = 0; i < asteroidList.size();){
    for(int j = 0; j < bullets.size();){
      Asteroid a = asteroidList.get(i);
      Bullet b = bullets.get(j);
      float dist = (float)dist((float)a.getX(), (float)a.getY(), (float)b.getX(), (float)b.getY());
      if(dist < a.getRadius()){
        asteroidList.remove(i);
        bullets.remove(j);
        if(asteroidList.size() == 0 || bullets.size() == 0){
          break;
        }
      } else {
         j++;
      }
    }
    if(asteroidList.size() == 0 || bullets.size() == 0){
          break;
    }
    i++;
  }
}
void keyPressed(){
  if(key == ' '){
    bullets.add(new Bullet(spaceship));
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

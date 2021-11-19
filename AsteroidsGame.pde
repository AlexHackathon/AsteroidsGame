Star[] stars;
Spaceship spaceship;
ArrayList<Bullet> bullets;
boolean turnLeft = false;
boolean turnRight = false;
boolean boosting = false;
boolean decelerating = false;
ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
void setup(){
  bullets = new ArrayList<Bullet>();
  stars = new Star[200];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  spaceship = new Spaceship(200,200);
  size(400,400);
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
      //asteroidList.get(i).setRadius(asteroidList.get(i).getRadius()/2);
    } else {
       i++;
    }
  }
  for(int i = 0; i < bullets.size(); i++){
    bullets.get(i).move();
    bullets.get(i).show();
    bullets.get(i).Offscreen();
  }
  /*
  for(int i = 0; i < bullets.size();){
    if(!bullets.get(i).getActive()){
      bullets.remove(i);
    } else {
      i++;
    }
  }*/
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

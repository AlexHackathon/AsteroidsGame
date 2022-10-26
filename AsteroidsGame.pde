Star[] stars;
Spaceship spaceship;
ArrayList<Bullet> bullets;
boolean turnLeft = false;
boolean turnRight = false;
boolean boosting = false;
boolean decelerating = false;
ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
int bigAsteroid = 20;
int smallAsteroid = 10;
int smallestAsteroid = 5;

int level;
boolean inbetweenLevels;
void setup(){
  inbetweenLevels = false;
  level = 1;
  size(400,400);
  bullets = new ArrayList<Bullet>();
  stars = new Star[200];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  spaceship = new Spaceship(200,200);
  for(int i = 0; i < level; i++){
    asteroidList.add(new Asteroid(bigAsteroid));
  }
}
void mouseClicked(){
  if(inbetweenLevels){
    inbetweenLevels = false;
    resetGame();
  }
  if(spaceship.getDead()){
    level = 0;
    resetGame();
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
    textSize(50);
    text("Game Over",200,200);
    return;
  }
  if(asteroidList.size() == 0){
    fill(255,255,255);
    spaceship.show();
    textAlign(CENTER);
    textSize(50);
    text("Level " + (level + 1),200,200);
    inbetweenLevels = true;
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
  spaceship.setCurrFrames(spaceship.getCurrFrames() + 1);
  spaceship.drawHealth();
  //Move and show asteroids
  for(Asteroid a : asteroidList){
    a.move();
    a.show();
  }
  //Remove asteroids when hit by spaceship
  for(int i = 0; i < asteroidList.size();){
    Asteroid a = asteroidList.get(i);
    float dist = distBetween((float)a.getX(), (float)a.getY(), (float)spaceship.getX(), (float)spaceship.getY());
    if(dist < a.getRadius()){
      if(a.getRadius() == bigAsteroid * 2){
          spaceship.decreaseHealth(5);
        } else if(a.getRadius() == smallAsteroid * 2){
          asteroidList.add(new Asteroid(smallestAsteroid, a.getX(), a.getY()));
          asteroidList.add(new Asteroid(smallestAsteroid, a.getX(), a.getY()));
          spaceship.decreaseHealth(2);
        } else if(a.getRadius() == smallestAsteroid * 2){
          spaceship.decreaseHealth(1);
        }
      if(spaceship.getHealth() <= 0){
        spaceship.die();
      }
      asteroidList.remove(i);
    } else {
       i++;
    }
  }
  //Move Bullets
  for(int i = 0; i < bullets.size();){
    if(bullets.get(i).Offscreen()){
      bullets.remove(i);
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
      float dist = distBetween((float)a.getX(), (float)a.getY(), (float)b.getX(), (float)b.getY());
      if(dist < a.getRadius()){
        if(a.getRadius() == bigAsteroid * 2){
          asteroidList.add(new Asteroid(smallAsteroid, a.getX(), a.getY()));
          asteroidList.add(new Asteroid(smallAsteroid, a.getX(), a.getY()));
        } else if(a.getRadius() == smallAsteroid * 2){
          asteroidList.add(new Asteroid(smallestAsteroid, a.getX(), a.getY()));
          asteroidList.add(new Asteroid(smallestAsteroid, a.getX(), a.getY()));
        }
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
    if(spaceship.canShoot()){
      spaceship.setCurrFrames(0);
      bullets.add(new Bullet(spaceship));
    }
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
private float distBetween(float x1, float y1, float x2, float y2){
  return (float)Math.sqrt(Math.pow(x1 - x2, 2) + Math.pow(y1-y2,2));
}
void resetGame(){
  bullets = new ArrayList<Bullet>();
  stars = new Star[200];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  spaceship = new Spaceship(200,200);
  asteroidList = new ArrayList<Asteroid>();
  for(int i = 0; i < level; i++){
    asteroidList.add(new Asteroid(bigAsteroid));
  }
}

Star[] stars;
Spaceship spaceship;
boolean turnLeft = false;
boolean turnRight = false;
boolean boosting = false;
boolean decelerating = false;
ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
void setup(){
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
  for(int i = 0; i < stars.length; i++){
    stars[i].Show();
  }
  if(spaceship.getDead()){
    fill(255,255,255);
    textAlign(CENTER);
    text("Game Over",200,200);
    return;
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
  spaceship.move();
  for(Asteroid a : asteroidList){
    a.move();
    a.show();
  }
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
}
void keyPressed(){
  if(key == ' '){
    //spaceship.Shoot();
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

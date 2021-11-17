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
  spaceship.move();
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

PVector shipCoor;
PVector meteorCoor;
PVector gravCoor;
PVector gravSpeed;
PVector shipSpeed;
PVector distance;

void setup() {
  size(displayWidth, displayHeight);
  shipCoor = new PVector(width/3, height/3);
  meteorCoor = new PVector(width/2, height/2);
  gravCoor = new PVector(meteorCoor.x- 20, meteorCoor.y - 50 );
  gravSpeed = new PVector(3, -3);
}

void draw() {
  background(255);
  ellipse(shipCoor.x, shipCoor.y, 10, 10);
//  ellipse(gravCoor.x, gravCoor.y, 5, 5);
  rect(meteorCoor.x, meteorCoor.y, 20, 20);
  distance = PVector.sub(gravCoor, shipCoor);
  distance.normalize();
  distance.mult(3);
  if (gravCoor.x < meteorCoor.x - 100 || gravCoor.x > meteorCoor.x + 200) {
    gravSpeed.x *= -1;
  }

  if (gravCoor.y < meteorCoor.y - 200 || gravCoor.y > meteorCoor.y + 100) {
    gravSpeed.y *= -1;
  }
  gravCoor.sub(gravSpeed);

  shipCoor.add(distance);
}




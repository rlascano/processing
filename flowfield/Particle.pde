class Particle {

  PVector pos;
  PVector vel;
  PVector acc;
  int maxspeed;
  int h;
  PVector prevPos;
  
  Particle() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxspeed = 4;
    h = 0;
    prevPos = pos.copy();
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void follow(PVector[] vectors) {
    int x = int(pos.x / scl);
    int y = int(pos.y / scl);
    int index = x + y * cols;
    PVector force = vectors[index];
    applyForce(force);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void show() {
    stroke(h, 255, 255, 25);
    h += 1;
    if(h > 255) h = 0;
    strokeWeight(1);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    updatePrev();
  }
  
  void updatePrev(){
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }
  
  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePrev();
    }
    if (pos.x < 0) {
      pos.x = width;
      updatePrev();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePrev();
    }
    if (pos.y < 0) {
      pos.y = height;
      updatePrev();
    }
  }
}

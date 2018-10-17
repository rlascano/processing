//Port of the coding challenge 24 from coding train
//youtube channel

float inc = 0.1;
int scl = 10;
int cols, rows;

float zoff = 0;

Particle[] particles;

PVector[] flowfield;

void setup() {  
  size(1366, 768);
  background(51);
  colorMode(HSB, 255);
  cols = (width / scl)  + 1;
  rows = (height / scl) + 1;
      
  flowfield = new PVector[cols * rows];
  particles = new Particle[1000];
 
  for(int i = 0; i < 1000; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      int index = x + y * cols;
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(angle);
      v.setMag(1);
      flowfield[index] = v;
      xoff += inc;
    }
    yoff += inc;

    zoff += 0.0003;
  }

  for (int i = 0; i < particles.length; i++) {
    particles[i].edges();
    particles[i].show();
    particles[i].follow(flowfield);
    particles[i].update();     
  } 
  if(frameCount % 1000 == 0)
    saveFrame("Wallpaper.png");
}

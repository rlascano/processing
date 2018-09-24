ArrayList<PVector> points = new ArrayList<PVector>();
float angle = 0;

void setup() {
  size(600, 400);
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  noFill();
  
  if(points.size() > 1000) {
    points = new ArrayList<PVector>();
  }
  
  float x = sin(angle / 90) * 280;
  float y = sin(angle /20) * 190;
  angle += 0.5;
  points.add(new PVector(x, y));
  
  float offset = 0;
  beginShape();
  for(int i = 0; i < points.size(); i++) {
    float h = map(points.get(i).x, -300, 300, 0, 255);
    stroke(h, 255, 255);
    vertex(points.get(i).x + offset, points.get(i).y);
    offset += 0.1;
    offset = sin(offset) * 5;
  }
  endShape();
}

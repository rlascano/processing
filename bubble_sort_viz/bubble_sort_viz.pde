float[] values;
int i, j = 0;

void setup() {
  size(800, 500);
  //fullScreen();
  values = new float[width];
  for(int i = 0; i < values.length; i++) {
    values[i] = noise(i/100.0)*height;
  }  
}

void draw() {
  background(0, 0, 255);  
    
  if(i < values.length) {
    for(j = 0; j < values.length - i - 1; j++) {
      if(values[j] > values[j+1]) {
        float temp = values[j];
        values[j] = values[j+1];
        values[j+1] = temp;
      }    
    }
    i++;
  } else {
    noLoop();
  }
  
  for(int i = 0; i < values.length; i++) {
    float c = map(values[i], 0, max(values), 0, 255);
    stroke(c, 0 , 0);
    line(i, height, i, height - values[i]);
  }  
}

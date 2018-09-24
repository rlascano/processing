float[] values;
int i = 1;
int j = 0;

void setup() {
  size(200, 500);
  //fullScreen();
  values = new float[width];
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
  print(values.length);
}

void draw() {
  background(0, 0, 255);  

  if (values[j] > values[j+1]) {
    float temp = values[j];
    values[j] = values[j+1];
    values[j+1] = temp;
  } 

  if (i < values.length) {
    if (j < values.length - i - 1) {
      j++;
    } else {
      j = 0; 
      i++;
    }    
  } else {
    noLoop();
  }

  for (int i = 0; i < values.length; i++) {
    float c = map(values[i], 0, max(values), 0, 255);
    if(i == j) {
      stroke(0, 255, 0);
    } else {
      stroke(c, 0, 0);
    }
    line(i, height, i, height - values[i]);
  }
}

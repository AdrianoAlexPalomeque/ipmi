//Alex Palomeque (93077/3)
//Tp3 Bucle For
//Video
PImage foto;
float distance = 5;
float trialCount = 40;

void setup() {
  size(800, 400);
  foto = loadImage("image.jpg");
  background(0);
}

void draw() {
  float tam = 8;
  image(foto, 0, 0, 400, 400);
  pushMatrix();
  translate(width - 200, height / 2);
  for (int j = 0; j < 20; j++) {
    boolean volD = (j % 2 == 0);
    for (int i = 0; i < trialCount; i++) {
      float angulo = 360 / trialCount * i;
      float scala = j * 0.1;
      trial(tam + distance * j, tam / 2 + distance * j, tam * 2 + distance * j, tam * 2 + distance * j, tam * 3 + distance * j, tam / 2 + distance * j, angulo, scala, volD);
    }
  }
  popMatrix();
  image(foto, 0, 0, 400, 400);
}

void trial(float x1, float y1, float x2, float y2, float x3, float y3, float rotacion, float scala, boolean vol) {
  pushMatrix();
  rotate(radians(rotacion));
  scale(scala);
  noStroke();
  fill(255);
  if (vol) {
    triangle(x1, y1, x2, y2, x3, y3); 
    fill(200);
    triangle(x1, y1, x2, y2, x3, y3); 
  } else {
    triangle(x1, -y1, x2, -y2, x3, -y3); 
    fill(200);
    triangle(x2, -y1, x2, -y2, x3, -y3);
  }
  popMatrix();
}

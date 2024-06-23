//Alex Palomeque (93077/3)
//Tp3 Bucle For
//Video
PImage foto;
float distancia = 4;
float trialCount = 40;
float tam = 8;
float r = 255, g = 255, b = 255;
float r2 = 200, g2 = 200, b2 = 200;
int filas = 30;

void setup() {
  size(800, 400);
  foto = loadImage("image.jpg");
}

void draw() {
  background(0);
  image(foto, 0, 0, 400, 400);
  for (int j = 0; j < filas; j++) {
    boolean volD = (j % 2 == 0);
    for (int i = 0; i < trialCount; i++) {
      float angulo = 360 / trialCount * i;
      float scala = j * 0.1;
      trial(tam + distancia * j, tam / 2 + distancia * j, tam * 2 + distancia * j, tam * 2 + distancia * j, tam * 3 + distancia * j, tam / 2 + distancia * j, angulo, scala, volD);
    }
  }
  image(foto, 0, 0, 400, 400);
}

void trial(float x1, float y1, float x2, float y2, float x3, float y3, float rotacion, float scala, boolean vol) {
  pushMatrix();
  translate(width - 200, height / 2);
  rotate(radians(rotacion));
  scale(scala);
  noStroke();
  fill(r, g, b);
  if (vol) {
    triangle(x1, y1, x2, y2, x3, y3);
    fill(r2, g2, b2);
    triangle(x2, y1, x2, y2, x3, y3);
  } else {
    triangle(x1, -y1, x2, -y2, x3, -y3);
    fill(r2, g2, b2);
    triangle(x2, -y1, x2, -y2, x3, -y3);
  }
  popMatrix();
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    if (tam >=1 && distancia>=3) {
      tam -= 3;
          distancia--;
      colores();
    }
  } else if (mouseButton == LEFT) {
        if (tam <=16*3+1) {
    tam += 3;
    distancia++;
    colores();
  }
}
}

void keyPressed() {
  tam = 8;
  distancia=4;
  r= 255;
  g= 255;
  b= 255;
  r2= 200;
  g2= 200;
  b2= 200;
}

void colores() {
  r = random(255);
  g = random(255);
  b = random(255);
  r2 = random(200);
  g2 = random(200);
  b2 = random(200);
}

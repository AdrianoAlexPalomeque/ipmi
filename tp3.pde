//Alex Palomeque (93077/3)
//Tp3 Bucle For
//Video https://www.youtube.com/watch?v=zjrdjT9XT8E
PImage foto;
float distancia = 4;
float trialCant = 40;
int filas = 30;
float tam = 8;
float r = 255, g = 255, b = 255;
float r2 = 200, g2 = 200, b2 = 200;
boolean reiniciar;

void setup() {
  size(800, 400);
  foto = loadImage("image.jpg");
}

void draw() {
  background(0);
  image(foto, 0, 0, 400, 400);
  for (int j = 0; j < filas; j++) {
    boolean volD = (j % 2 == 0);
    for (int i = 0; i < trialCant; i++) {
      float opacidad = map(j, 0, filas/3, 50, 255);
      float angulo = 360 / trialCant * i;
      float scala = j * 0.1;
      trial(tam + distancia * j, tam / 2 + distancia * j, tam * 2 + distancia * j, tam * 2 + distancia * j, tam * 3 + distancia * j, tam / 2 + distancia * j, angulo, scala, volD, opacidad);
    }
  }
  image(foto, 0, 0, 400, 400);
}

void trial(float x1, float y1, float x2, float y2, float x3, float y3, float rotacion, float scala, boolean vol, float opa) {
  pushMatrix();
  translate(width - 200, height / 2);
  rotate(radians(rotacion));
  scale(scala);
  noStroke();
  fill(r, g, b, opa);
  if (vol) {
    triangle(x1, y1, x2, y2, x3, y3);
    fill(r2, g2, b2, opa);
    triangle(x2, y1, x2, y2, x3, y3);
  } else {
    triangle(x1, -y1, x2, -y2, x3, -y3);
    fill(r2, g2, b2, opa);
    triangle(x2, -y1, x2, -y2, x3, -y3);
  }
  popMatrix();
}

void mouseClicked() {
  if (mouseX >= 0 && mouseX <= 400 && mouseY >= 0 && mouseY <= 400) {
    reiniciarvar();
    return;
  }

  if (mouseButton == RIGHT) {
    if (tam >= 1 && distancia >= 3) {
      tam -= 3;
      distancia--;
      colores();
    }
  } else if (mouseButton == LEFT) {
    if (tam <= 16 * 3 + 1) {
      tam += 3;
      distancia++;
      colores();
    }
  }
}

void reiniciarvar() {
  tam = 8;
  distancia = 4;
  r = 255;
  g = 255;
  b = 255;
  r2 = 200;
  g2 = 200;
  b2 = 200;
}

void colores() {
  r = random(255);
  g = random(255);
  b = random(255);
  r2 = random(200);
  g2 = random(200);
  b2 = random(200);
}

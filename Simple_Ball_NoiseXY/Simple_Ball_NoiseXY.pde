
Ball[]bs;
int num=1;

void setup() {
  size(800, 600);

  bs=new Ball[10];
  for (int i=0; i<10; i++) {
    bs[i]=new Ball();
  }
}


void draw() {
  background(0);

  for (int i=0; i<num; i++) {
    bs[i].update();
  }
}

void mousePressed() {
  num=bs.length-num;
}


class Ball {

  float start_pos=random(100);
  float xpos;
  float ypos;

  Ball() {
  }

  void update() {
    float scale=0.01;

    xpos=noise(start_pos+frameCount*scale)*width;
    ypos=noise(start_pos+5+frameCount*scale)*height;

    ellipse(xpos, ypos, 10, 10);
  }
}

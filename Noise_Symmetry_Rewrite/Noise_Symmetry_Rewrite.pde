//Writen by Undercurrent for 一朵Processing
//Inspired by muzikermammoth at https://www.openprocessing.org/sketch/550605


int num=5;
float rot=TWO_PI/num;
float x, y, xx, yy;
float rx=1;
float ry=1;
float seed=0;

void setup() {
  size(1280, 800);
  background(0);
  stroke(255, 5);
}

void draw() {
  translate(width/2, height/2);

  for (int i=0; i<500; i++) {
    x=random(-1, rx);
    y=random(-1, ry);

    xx=map(noise(x, y, seed), 0, 1, -200, 400);
    yy=map(noise(y,x, seed), 0, 1, -200, 400);
    
    //yy=map(noise(x+10000,y+10000, seed), 0, 1, -200, 400);

    pushMatrix();
    for (int r=1; r<=num; r++) {
      rotate(rot);
      point(xx, yy);
    }
    popMatrix();
  }
  
  
  
  if (frameCount%200==0) {
    rx++;
  }
  if (frameCount%100==0) {
    ry++;
  }

  //noLoop();
}

void mousePressed() {
  background(0);
  rx=1;
  ry=1;
  seed=random(100);
  //randomSeed(frameCount);
  //rx=random(100);
  //ry=random(100);
}

int npts=500;
float xOffset=0;
float yOffset=0;
float inc=1;
float centerX, centerY;

void setup() {
  size(1920, 1080);
  background(0);
  noFill();
  colorMode(HSB);
  centerX=0;
  centerY=height/2;
}

void draw() {
  stroke((frameCount*0.05)%255, 180, 255, 64);
  beginShape();
  for (int i=0; i<npts; i++) {
    float angle=TWO_PI*i/npts;
    PVector p=new PVector(cos(angle),sin(angle));

    float radius=noise(xOffset+p.x*inc, yOffset+p.y*inc)*200;
    p.mult(radius);
    vertex(p.x+centerX, p.y+centerY);
  }
  endShape(CLOSE);

  xOffset+=0.006;
  yOffset+=0.006;
  
  centerX++;
  if (centerX>width) {
    centerX=0;
    background(0);
  }
}

Particle[]pts;
float noiseScale=0.007;
float timeFactor;

void setup() {
  size(700, 700);
  
  colorMode(HSB);
  stroke(0, 200, 222, 10);
  
  background(255);

  pts=new Particle[4096];
  for (int i=0; i<pts.length; i++) {
    pts[i]=new Particle();
  }
  
  timeFactor=0.007;
}

void draw() {
  for (int i=0; i<pts.length; i++) {
    pts[i].update();
  }

  timeFactor+=0.007;

  if (mousePressed) {
    background(255);
  }
}


class Particle {
  PVector pos;
  PVector vel;

  Particle() {
    pos=new PVector(random(width), random(height));
    vel=new PVector(0, 0);
  }

  void update() {
    float len=10*noise(200+pos.x*noiseScale, 200+pos.y*noiseScale, timeFactor*2);
    float angle=2*TWO_PI*noise(pos.x*noiseScale, pos.y*noiseScale, timeFactor*0.5);
    vel.set(len*cos(angle), len*sin(angle));
    pos.add(vel);

    if (pos.x<0 || pos.x>width || pos.y<0 || pos.y>height) {
      pos.set(random(width), random(height));
    }      
    //timeFactor+=0.007;    //加这行可以模糊

    point(pos.x, pos.y);
  }
}

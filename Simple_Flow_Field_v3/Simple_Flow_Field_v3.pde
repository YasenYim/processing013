Boid[]boats;

void setup() {
  size(800,600);
  background(0);
  colorMode(HSB);
  
  boats=new Boid[5000];

  for (int i=0; i<boats.length; i++) {
    boats[i]=new Boid();
  }
}

void draw() {
  fill(0,14);
  noStroke();
  rect(0,0,width,height);

  strokeWeight(3);
  for (int i=0; i<boats.length; i++) {
    boats[i].update();
    boats[i].display();
  }

  //surface.setTitle(nf(frameRate, 0, 2));
}



class Boid {
  PVector pos;
  PVector vel;
  float hue;

  Boid() {
    pos=new PVector(random(width), random(height));
    vel=new PVector();
  }

  void update() {
    float scale=0.01;
    float noiseValue=noise(pos.x*scale, pos.y*scale,frameCount*scale*2);
    float angle=noiseValue*TWO_PI*1;
    
    float magnitude=noise(pos.x*scale+1111, pos.y*scale+2222,frameCount*scale)*5;
    vel.set(cos(angle)*magnitude, sin(angle)*magnitude);
    
    hue=noise(pos.x*scale+3333, pos.y*scale+4444,frameCount*scale)*255;

    pos.add(vel);
    if (pos.x<0 || pos.x>width || pos.y<0 || pos.y>height) {
      pos.set(random(width), random(height));
    }
  }

  void display() {
    stroke(hue,255,255, 100);
    point(pos.x, pos.y);
  }
}

Boid[]boats;

void setup() {
  size(800, 600);
  background(0);

  boats=new Boid[500];

  for (int i=0; i<boats.length; i++) {
    boats[i]=new Boid();
  }
}

void draw() {
  //fill(0,14);
  //noStroke();
  //rect(0,0,width,height);

  strokeWeight(3);
  for (int i=0; i<boats.length; i++) {
    boats[i].update();
    boats[i].display();
  }

  surface.setTitle(nf(frameRate, 0, 2));
}



class Boid {
  PVector pos;
  PVector vel;

  Boid() {
    pos=new PVector(random(width), random(height));
    vel=new PVector();
  }

  void update() {
    float scale=0.001;
    float noiseValue=noise(pos.x*scale, pos.y*scale);
    float angle=noiseValue*TWO_PI*800;
    float magnitude=0.3;
    vel.set(cos(angle)*magnitude, sin(angle)*magnitude);

    pos.add(vel);
    if (pos.x<0 || pos.x>width || pos.y<0 || pos.y>height) {
      pos.set(random(width), random(height));
    }
  }

  void display() {
    stroke(255, 100);
    point(pos.x, pos.y);
  }
}

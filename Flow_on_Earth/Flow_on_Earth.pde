/**
* flow on earth
* 
* @author aa_debdeb
* @date 2016/04/20
*/

float radious = 250;
ArrayList<Particle> particles;
PVector noiseOffset1, noiseOffset2;
float noiseScale = 0.01;
float maxVel = PI / 32;
PImage img;

void setup(){
  //size(565, 800, P3D);
  size(800, 800, P3D);
  mousePressed();
  stroke(56, 100);
  noFill();
}

void mousePressed(){
  particles = new ArrayList<Particle>();
  noiseOffset1 = new PVector(random(1000000), random(1000000), random(1000000));
  noiseOffset2 = new PVector(random(1000000), random(1000000), random(1000000));
}

void draw(){
  background(255); 


  translate(width / 2, height / 2);
  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.002);
  rotateZ(frameCount * 0.003);
  for(Particle particle: particles){
    particle.update();
    particle.draw();
  }
  particles.add(new Particle());
  
}

class Particle{

  float r1, r2;
  ArrayList<PVector> trajectory;
  
  Particle(){
    r1 = random(TWO_PI);
    r2 = random(TWO_PI);
    trajectory = new ArrayList<PVector>();
    trajectory.add(getRectangularCoordinate());
  }
  
  void update(){
    if(trajectory.size() < 100){
      PVector p = trajectory.get(trajectory.size() - 1);
      r1 += map(noise(noiseOffset1.x + p.x * noiseScale, noiseOffset1.y + p.y * noiseScale, noiseOffset1.z + p.z * noiseScale), 0, 1, -maxVel, maxVel);
      r2 += map(noise(noiseOffset2.x + p.x * noiseScale, noiseOffset2.y + p.y * noiseScale, noiseOffset2.z + p.z * noiseScale), 0, 1, -maxVel, maxVel);
      if(r1 < 0){r1 += TWO_PI;}
      if(r1 >= TWO_PI){r1 -= TWO_PI;}
      if(r2 < 0){r2 += TWO_PI;}
      if(r2 >= TWO_PI){r2 -= TWO_PI;}
      trajectory.add(getRectangularCoordinate());
    }
  }
  
  void draw(){
    beginShape();
    for(PVector p: trajectory){
      vertex(p.x, p.y, p.z);
    }
    endShape();
  }
  
  PVector getRectangularCoordinate(){
    float x = radious * sin(r1) * cos(r2);
    float y = radious * sin(r1) * sin(r2);
    float z = radious * cos(r1);
    return new PVector(x, y, z);
  }
  
}

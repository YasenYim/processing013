/* Inspired by 

Majyk 
by Adam Lastowka

at https://www.openprocessing.org/sketch/95650
*/


PVector mouse;
Particle[]pts;

void setup(){
  
  size(1920,1080,P2D);
  background(0);
  
  pts=new Particle[18000];
  for(int i=0;i<pts.length;i++){
    pts[i]=new Particle();
  }
  
  mouse=new PVector(0,0);
  
  //blendMode(ADD);
}


void draw(){
  fill(0,20);
  stroke(0);
  rect(0,0,width,height);
  
  //background(0);
  
  mouse.set(mouseX,mouseY);

  for(int i=0;i<pts.length;i++){
    pts[i].update();
  }
  
  surface.setTitle(nf(frameRate,0,2));
}


class Particle{
  
  PVector prevPos;
  PVector pos;
  PVector vel;
  
  float exponent=random(-1,1);
  float factor=random(0.3, 1.5);
  
  color col;
  
  Particle(){
    
    pos=new PVector(random(width),random(height));
    prevPos=pos.copy();
    
    vel=new PVector(0,0);
   
    //col=color(44*(exponent+1),117*(exponent+1),255,30);
    
    col=color(random(88),random(234),255,random(30,50));
  }
  
  void update(){
    
    float d2m = PVector.dist(pos,mouse);
    d2m*=0.01;
    
    PVector dist_acc=PVector.sub(mouse,pos);
    //acc.mult(pow(d2m,exponent)*factor*0.001);
    dist_acc.mult(factor*0.001);    
    vel.add(dist_acc);
    
    float ns=0.03;
    float noise_x=noise(pos.x*ns,pos.y*ns,frameCount*0.01)-0.5;
    float noise_y=noise(pos.x*ns,pos.y*ns+9999,frameCount*0.01)-0.5;
    PVector noise_acc=new PVector(noise_x,noise_y);    
    noise_acc.mult(3);
    vel.add(noise_acc);
    
    
    //float friction=noise(pos.x*0.05+999,pos.y*0.05+999,frameCount*0.01)-0.5;
    //friction*=0.0033;
    //friction+=0.95;
    
    //vel.mult(friction);
    vel.mult(0.95);
  
    
    prevPos=pos.copy();
    prevPos.add(PVector.div(vel,3));
    pos.add(vel);
 
    
    stroke(col);
 
    line(pos.x,pos.y,prevPos.x,prevPos.y);
    
  }
}
    
  

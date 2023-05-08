int ballQty;
float hueValue;
float diameter;

PVector[]pts;

void setup(){
  size(600,400);
  background(255);
  colorMode(HSB);
  
  ballQty=300;
  hueValue=random(255);
  
  pts=new PVector[4000];
  for(int i=0;i<pts.length;i++){
    pts[i]=new PVector(random(width),random(height));
  }
  
  stroke(hueValue,255,255,64);
  for(int j=0;j<40;j++){
    for(int i=0;i<pts.length;i++){
      float angle=map(noise(pts[i].x*0.007,pts[i].y*0.007,frameCount+0.007),0,1,0,TWO_PI);
      float len=map(noise((pts[i].x+2000)*0.007,(pts[i].y+2000)*0.007,frameCount+0.026),0,1,0,3);
      pts[i].add(new PVector(cos(angle)*len,sin(angle)*len));
      point(pts[i].x,pts[i].y);
    }
  }
  
  
  noStroke();
  
  for(int i=0;i<ballQty;i++){
    fill(hueValue,random(255),random(255),100);
    
    if(random(1)<0.1){      
      diameter=random(25,30);
    }else{
      diameter=random(8,14);
    }
    
    ellipse(random(width),random(height),diameter,diameter);
  }
}


void draw(){
}

void mousePressed(){
  setup();
}

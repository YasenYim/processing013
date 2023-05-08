

float xOffset=0;
float yOffset;

float offsetInc=0.006;
float inc=1;
float s=1;  //start size of perlin ring
float m=1.005;

void setup(){
  size(500,500);
  background(0);
  blendMode(ADD);
  noFill();
  stroke(255,64,8,128);
}

void draw(){
  translate(width/2,height/2);
  
  if(s<8000){
    int nPoints;
    for(int nTimes=0;nTimes<10;nTimes++){
      nPoints=int(TWO_PI*s);
      nPoints=min(nPoints,500);

      beginShape();
      for(int i=0;i<nPoints;i++){
        float a=TWO_PI*i/nPoints;
        PVector p=PVector.fromAngle(a);
        float n=noise(xOffset+p.x*inc,yOffset+p.y*inc)*s;
        p.mult(n);
        vertex(p.x,p.y);
      }
      endShape(CLOSE);
      
      xOffset+=offsetInc;
      yOffset+=offsetInc;
      
      s*=m;
    }
  }else{
    s=1;
    background(0);
  }
}

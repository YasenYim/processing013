//Original work by muzikermammoth at https://www.openprocessing.org/sketch/550605
//Rewritten by Undercurrent

int num=5;
float x,y,xx,yy;
float rx=1;
float ry=1;
float seed=0;

void setup(){
  size(1280,800);
  background(0);
  stroke(255,5);
}

void draw(){
  translate(width/2,height/2);
  rotate(-PI/2);
  for(int i=0;i<5000;i++){
    for(int r=1;r<=num;r++){
      x=random(-1,rx);
      y=random(-1,ry);
      
      xx=map(noise(x,y,seed),0,1,-200,400);
      yy=map(noise(y,x,seed),0,1,-200,400);
      
      pushMatrix();

      rotate(r*TWO_PI/num);
  
      point(xx,yy);
      popMatrix();
    }
  }
  if(frameCount%200==0){
    rx++;
  }
  if(frameCount%100==0){
    ry++;
  }
}

void mousePressed(){
  background(0);
  rx=1;
  ry=1;
  seed=random(100);

}

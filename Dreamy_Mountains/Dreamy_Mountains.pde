
int granular=5;    //cell size of the base grid
int rad=600;      //visible radius
int ballQty=100;    //how many balls
float timeFactor=0.01;  //how fast the mountain shape varies

Ball[]balls;    //all balls stored in array

void setup() {
  size(900, 900, P3D);  //canvas size
  colorMode(HSB);    //color based on hue
  lights();      //default light setting, seems not working
  
  balls=new Ball[ballQty];  //initilize the array
  for(int i=0;i<balls.length;i++){    //put balls into the array
    balls[i]=new Ball();
  }
  
  sphereDetail(16);  //reduce the vertices needed to render the sphere, so the render will be faster
}

void draw() {
  background(255);  //background
  //lights();

  pushMatrix();  
  translate(width/2, height/2);    //move the coords to the canvas center
  rotateX(PI/3);    //rotate to have better perspective
  //rotateZ(map(mouseX, 0, width, 0, TWO_PI));  //rotate along horizontal mouse position
  rotateZ(frameCount*0.004);

  strokeWeight(2);
  noStroke();
  for (int i=-rad; i<rad; i+=granular) {    //draw the grid (mountain)
    beginShape(QUAD_STRIP);        //strip mode
    for (int j=-rad; j<rad; j+=granular) {      //draw a quad strip
      float h=noise(i*0.03+99999, j*0.03, frameCount*timeFactor);  //vertex height and brightness
      float hue=noise(i*0.01+9999, j*0.01+9999, frameCount*timeFactor+9999)*255;  //hue value on tyhe vertex
      if (i*i+j*j<sq(rad)) {    //cut out a biggest circle from a rectangle
        fill(hue,90,(1-h)*255+50);  //morphing color for vertex in visible area
      } else {
        fill(255);    //paint white if vertex locates out of visible area
      }
      vertex(i, j, h*100);  //put first vertex into strip

      h=noise((i+granular)*0.03+99999, j*0.03, frameCount*timeFactor);
      hue=noise((i+granular)*0.01+9999, j*0.01+9999, frameCount*timeFactor+9999)*255;
      if (i*i+j*j<sq(rad)) {
        fill(hue,90,(1-h)*255+50);
      } else {
        fill(255);
      }
      vertex(i+granular, j, h*100);    //put second vertex into strip
    }
    endShape();
  }

  fill(#FF5D5D);
  pushMatrix();
  translate(0,0,sin(frameCount*0.01)*100);    //uprising sun, (biggest red ball)
  sphere(50);
  popMatrix();
  
  for(int i=0;i<balls.length;i++){    //render all balls
    balls[i].update();
    balls[i].display();
  }

  popMatrix();
  fill(0);
  //text(frameRate, width-90, 30);  //monitor the framerate and topright corner
}


class Ball{      //Ball 
  PVector pos;      //position
  PVector spd;      //speed
  PVector gravity;
  color c;  
  
  Ball(){
    reset();    //initialize the ball at random position
    gravity=new PVector(0,0,-0.1);    //set gravity value
    c=color(random(255),140,220);    //get a random color
  }
  
  void reset(){
    float r=random(rad);      //radius from the center     
    float theta=random(TWO_PI);    
    pos=new PVector(cos(theta)*r,sin(theta)*r,-50);    //random position generated from polar system
    
    theta=random(TWO_PI);
    r=random(2);
    spd=new PVector(cos(theta)*r,sin(theta)*r,random(3,9));    //random speed pointing upward
  }
  
  boolean dropDown(){    //if the ball drops below the mountain plane
    if(pos.z<-50){
      return true;
    }else{
      return false;
    }
  }
  
  void update(){      //update ball position
    pos.add(spd);
    spd.add(gravity);
    if(dropDown()){      //if the position is too low, reset position
      reset();
    }
  }
  
  void display(){    //draw the ball
    fill(c);
    
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    sphere(8);
    popMatrix();
  }
}

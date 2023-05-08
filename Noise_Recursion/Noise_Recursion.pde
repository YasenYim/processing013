
void setup(){
  size(300,300);
}

void draw(){

  loadPixels();
  
  for(float x=0;x<width;x++){
    for(float y=0;y<height;y++){

      float qx=noise(x/width,y/height);
      float qy=noise(x/width+400,y/height+100);
      
      float rx=noise(x/width+4*qx+1000,y/height+4*qy+6000);
      float ry=noise(x/width+4*qx+frameCount*0.01,y/height+4*qy+frameCount*0.01+888);
      
      float noise=noise(x/width+4*rx,y/height+4*ry)*255;
      
      pixels[int(y*width+x)]=color(noise);
    }
  }
  updatePixels();
  
}

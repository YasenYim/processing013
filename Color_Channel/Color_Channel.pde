
size(600, 400);

loadPixels();

for (int x=0; x<width; x++) {    
  for (int y=0; y<height; y++) {

    float r=noise(x*0.01, y*0.01)*511-100;   
    float g=noise(x*0.003+520, y*0.003+1314)*400;
    float b=noise(x*0.005+123, y*0.005+987)*512;

    pixels[x+y*width]=color(r, g, b);
  }
}

updatePixels();

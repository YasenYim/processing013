//Modified by Undercurrent, origin work by:

//abandonedart_75_shimmer
// Apr 2010
// http://www.abandonedart.org
// http://www.zenbullets.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://www.zenbullets.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// These conditions can be waived if you want to do something groovy with it 
// though, so feel free to email me via http://www.zenbullets.com


void setup(){
  size(1000,700);
}

void draw(){
  background(0);
  stroke(255,50); 
  translate(width/2,height/2);  
  rotate(frameCount*0.004);
  for(int y=-300;y<=300;y+=15){
    for(int x=-300;x<=300;x+=15){
      float noiseY=frameCount*0.01+y*0.005;
      float noiseX=frameCount*0.01+9999+x*0.005;      
      float nf=noise(noiseX,noiseY);
      ellipse(x*nf,y*nf,5*nf,5*nf);      
    }
  }
}
 

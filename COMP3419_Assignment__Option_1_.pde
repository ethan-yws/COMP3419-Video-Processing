//COMP3419 Assignment
//Option 1
//Intelligent Animation
//@author: Yiwei Shi
//
//References
/************************************************************************************************
* Some source code are from the Lab Solutions (dilation, eorsion filers, etc.)
* Some source code used from the following url(s):
* https://github.com/cbyr2401/comp3419-ass1-github/blob/master/Intelligent_Animation(filters etc)
* https://www.youtube.com/watch?v=spGP0B8SGnk
*************************************************************************************************/

//Using the follwing two libraries to appraoch
//Need to be installed manually
import processing.sound.*;
import processing.video.*;

Movie monkey;
Movie moivebg;

SoundFile BGM;
SoundFile kiss;

PImage frameRmBg;
PImage frameCapRed;
PImage frameBin;
PImage frameDi, frameEor;

PImage body2;
PImage shame;
Eltron eltron;

LeftArm la;
RightArm ra;
LeftLeg ll;
RightLeg rl; 
Body bd;


//Data Structure to store motion locations
ArrayList<Motions> dots = new ArrayList<Motions>();

//Objects update param
float a = 0;
float b = 0;
float c = 568;
float d = 0;

void setup() {
   size(568, 320);
   //frameRate(12);
   //bg = loadImage("images/ny.jpg");
   monkey = new Movie(this, sketchPath("../monkey (option1).mov"));
   moivebg = new Movie(this, sketchPath("videos/space.mp4"));
   moivebg.loop();
   BGM = new SoundFile(this, sketchPath("sounds/theme.mp3"));
   kiss = new SoundFile(this, sketchPath("sounds/kiss.mp3")); 
   //fill(255, 255, 0);
   
   //Setting the texture of the Marionette Body
   //Iron Man
   PImage moon = loadImage("marionette/ghost.png");
   moon.resize(60, 60);
   
   PImage body = loadImage("marionette/emoji.png");
   body2 = loadImage("marionette/love.png");
   body.resize(100, 100);
   body2.resize(100, 100);
   
   shame = loadImage("marionette/shame.png");
   shame.resize(60, 60);
   
   la = new LeftArm(moon, 0 , 0);
   ra = new RightArm(moon, 0 , 0);
   ll = new LeftLeg(moon, 0, 0);
   rl = new RightLeg(moon, 0, 0);
   bd = new Body(body, 0, 0);
   
   //Eltron
   PImage img = loadImage("images/kiss.png");
   img.resize(50,50);
   
   //skill = loadImage("images/blast.png");
   //skill.resize(90,90);
   
   eltron = new Eltron(img, 0, 0);
   if(BGM != null){
     BGM.play();
   }
   
   monkey.play();
   //moivebg.play();
   
   //exit();
}

void draw() {
  image(moivebg, 0 ,0, 568, 320);
  //starry_sky();
  //frameRate(24);
  float time = monkey.time();
  float duration = monkey.duration();
  if(time > duration){
    exit();
  }
  
  //background(0);
  
  //Checking Collison
  if(dotsCapture(frameDi) != null){
    if(dotsCapture(frameDi).get(4).x - a < 50 && dotsCapture(frameDi).get(4).y -b < 50){
      kiss.play();
      kiss.pause();
      image(shame, dotsCapture(frameDi).get(0).x, dotsCapture(frameDi).get(0).y);
      image(shame, dotsCapture(frameDi).get(1).x, dotsCapture(frameDi).get(1).y);
      image(shame, dotsCapture(frameDi).get(2).x, dotsCapture(frameDi).get(2).y);
      image(shame, dotsCapture(frameDi).get(3).x, dotsCapture(frameDi).get(3).y);
      image(body2, dotsCapture(frameDi).get(4).x, dotsCapture(frameDi).get(4).y);
    }
    else if(c - dotsCapture(frameDi).get(4).x < 50 && d - dotsCapture(frameDi).get(4).y < 50){
      kiss.play();
      kiss.pause();
      image(shame, dotsCapture(frameDi).get(0).x, dotsCapture(frameDi).get(0).y);
      image(shame, dotsCapture(frameDi).get(1).x, dotsCapture(frameDi).get(1).y);
      image(shame, dotsCapture(frameDi).get(2).x, dotsCapture(frameDi).get(2).y);
      image(shame, dotsCapture(frameDi).get(3).x, dotsCapture(frameDi).get(3).y);
      image(body2, dotsCapture(frameDi).get(4).x, dotsCapture(frameDi).get(4).y);
    }
    else{ 
      image(la.leftarm, dotsCapture(frameDi).get(0).x, dotsCapture(frameDi).get(0).y);
      image(ra.rightarm, dotsCapture(frameDi).get(1).x, dotsCapture(frameDi).get(1).y);
      image(ll.leftleg, dotsCapture(frameDi).get(2).x, dotsCapture(frameDi).get(2).y);
      image(rl.rightleg, dotsCapture(frameDi).get(3).x, dotsCapture(frameDi).get(3).y);
      image(bd.body, dotsCapture(frameDi).get(4).x, dotsCapture(frameDi).get(4).y);
    }
  }
  
  drawEltron();
  
  drawEltron2();
}

void movieEvent(Movie m) {
  if(m.available()) {
    m.read();

    //Morphological Processes
      //remove Background
      //frameRmBg = removeBackground(m);
    //Capture Red pixels
    frameCapRed = CaptureRed(m);
    //transform to binary image
    frameBin = BinaryFilter(frameCapRed);
    //add Eorison filter
    frameEor = erosion2D(frameBin);
    //add Dilation filter
    frameDi = dilate2D(dilate2D(dilate2D(dilate2D(frameEor))));
  }
}


//Draw Starry Sky
void starry_sky() {
   fill(0, 10);
   rect(0, 0, width, height);
   fill(255);
   noStroke();
   ellipse(random(width), random(height), 6, 6);
}

void drawEltron() {
  image(eltron.eltron, a, b);
  a+=2;
  b+=2;
  //kiss.play();
  //kiss.pause();
}

void drawEltron2() {
  image(eltron.eltron, c, d);
  c-=2;
  d+=2;
 //kiss.play();
  //kiss.pause();
}

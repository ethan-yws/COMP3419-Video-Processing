//Functions related to morphological
//source code from lab soulutions
int BLUE = 120;
//int RED = 90;
//Remove the blue background
//*source code from lab solutions
PImage removeBackground(PImage frame) {
  for (int x = 0; x < frame.width; x ++)
    for (int y = 0; y < frame.height; y ++) {
      int loc = x + y * frame.width;
      color c = frame.pixels[loc];
      if ( blue(c) > BLUE){ 
                frame.pixels[loc] = 0; 
      }
    }

  frame.updatePixels();

  return frame;
}

//Check Brown Pixels
Boolean isBrown(color c) {
      if ( red(c) > 148 && red(c) < 201 && green(c) > 83 && green(c) < 166 && blue(c) > 39
           && blue(c) < 116){ 
           return true;
      }
  return false;
}

//Check Yellow Pixels
Boolean isYellow(color c) {
      if ( red(c) > 190 && red(c) < 254 && green(c) > 132 && green(c) < 199 && blue(c) > 44
           && blue(c) < 125){ 
           return true;
      }
  return false;
}


//Remove eveything expect the red pixel
PImage CaptureRed(PImage frame) {
  //generate a new image to draw red markers
  PImage tmp = new PImage(568, 320);
  
  for (int x = 0; x < frame.width; x ++)
    for (int y = 0; y < frame.height; y ++) {
      int loc = x + y * frame.width;
      color c = frame.pixels[loc];
      
      if(red(c) > 149 && green(c) > 37 && green(c) < 199 && blue(c) > 39
         && blue(c) < 125 & isBrown(c) == false && isYellow(c) == false) {
           tmp.pixels[loc] = c;
      }
           
    }

  //frame.updatePixels();

  return tmp;
}


//Binary filter
//*source code from online resources
PImage BinaryFilter(PImage frame) {
 for(int i=0; i < frame.width*frame.height; i++){
   int bright = int(brightness(frame.pixels[i]));
   if(bright > 128){
    frame.pixels[i] = color(255,255,255);
   }
   else{
     frame.pixels[i] = color(0,0,0);
   }
 }
 return frame;
}

//*Dilation and Eorsion Filter 
//*255: Dilation
//*0: Eorsion
//*source code from lab solutions
int kernelSize = 3;
int [][] kernel = {{0, 1, 0},
                   {1, 1, 1},
                   {0, 1, 0}};


// *source code from lab solutions
PImage dilate2D(PImage oimg) {
  PImage oimg_corrected = new PImage(oimg.width, oimg.height);
 
 // Initialise variables
 color white = color(255,255,255);
 color black = color(0,0,0);
 boolean D = false;

 for(int i=1; i < oimg.height-1; i++){
   for(int j=1; j < oimg.width-1; j++){
     D = false;
     
     // apply the matrix using these if statements (pretend matrix)
     if(oimg.pixels[(j+0) + ((i-1)*oimg.width)] == white) D = true;
     if(oimg.pixels[(j-1) + ((i+0)*oimg.width)] == white) D = true;
     if(oimg.pixels[(j+0) + ((i+0)*oimg.width)] == white) D = true;
     if(oimg.pixels[(j+1) + ((i+0)*oimg.width)] == white) D = true;
     if(oimg.pixels[(j+0) + ((i+1)*oimg.width)] == white) D = true;
     
     if(D){
       oimg_corrected.pixels[j + i*oimg.width] = white;
     }else{
       oimg_corrected.pixels[j + i*oimg.width] = black;
     }   
   }
 }
 return oimg_corrected;  
}


//*Eorsion Filter
//*source code from lab solutions
PImage erosion2D(PImage oimg) {
  PImage img_corrected = new PImage(oimg.width, oimg.height);
 
 // Initialise variables
 color white = color(255,255,255);
 color black = color(0,0,0);
 boolean D = false;
 boolean[] chk = new boolean[9];
 for(int i=1; i < oimg.height-1; i++){
   for(int j=1; j < oimg.width-1; j++){
     D = true;
     for(int k=0; k < 5; k++){
       chk[k] = false;
     }
     if(oimg.pixels[(j+0) + ((i-1)*oimg.width)] == white) chk[0] = true;
     if(oimg.pixels[(j-1) + ((i+0)*oimg.width)] == white) chk[1] = true;
     if(oimg.pixels[(j+0) + ((i+0)*oimg.width)] == white) chk[2] = true;
     if(oimg.pixels[(j+1) + ((i+0)*oimg.width)] == white) chk[3] = true;
     if(oimg.pixels[(j+0) + ((i+1)*oimg.width)] == white) chk[4] = true;

     for(int k=0; k < 5; k++){
      if(chk[k] == true){
        D = true;
      }else{
        D = false;
        break;
      }
     }
     
     if(D){
       img_corrected.pixels[j + i*oimg.width] = white;
     }else{
       img_corrected.pixels[j + i*oimg.width] = black;
     }   
   }
 }
 return img_corrected;  
}

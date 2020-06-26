//DataStructure to store the expected markers's locations
//Using Class and objects to hold x, y values
public class Motions {
  float x;
  float y;
  //Constructor to hold the locations of markers
  public Motions(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

//Capture Dots and Insert them floato an ArrayList<Motions>
// Reference
// *Implemented based on the framework from online resources
ArrayList<PVector> dotsCapture(PImage frame){
    ArrayList<PVector> dots = new ArrayList<PVector>(5);
    int maxx = 0;
    int maxy = 0;
    int minx = 200;
    int miny = 200;
    
    if(frame != null)
    for ( int x = 0; x < frame.width; x++ ){
      for ( int y = 0; y < frame.height; y++ ){
        int loc = x + y * frame.width;
        color c = frame.pixels[loc];
        // if pixel is color(255,255,255):
        if ( c == color(255,255,255)) {
           if ( x > maxx ) maxx = x;
           else if ( x < minx ) minx = x;
           
           if ( y > maxy ) maxy = y;
           else if (y < miny ) miny = y;
        }
      }
    }
    
    int quadrantx = (minx + maxx) / 2;
    int quadranty = (miny + maxy) / 2;
    int quadrant_threshold = 15;
    
    // these are here for later on.
    boolean tl = false;
    boolean tr = false;
    boolean bl = false;
    boolean br = false;

    TLLoop:
    for ( int x = minx; x < quadrantx - quadrant_threshold; x += 1 ){ 
      for ( int y = miny; y < quadranty - quadrant_threshold; y += 1 ){ 
        int loc = x + y * frame.width;
        color c = frame.pixels[loc];
        
        if ( c == color(255,255,255)) {
           dots.add(new PVector(x, y));
           tl = true;
           break TLLoop;
        }
      }
    }
    
    
    if ( !tl ) dots.add(new PVector(minx+25, miny+25));
    
    TRLoop:
    for ( int x = maxx; x > quadrantx + quadrant_threshold; x -= 1 ){ 
      for ( int y = miny; y < quadranty - quadrant_threshold; y += 1 ){ 
        int loc = x + y * frame.width;
        color c = frame.pixels[loc];
        // if pixel is color(255,255,255):
        if ( c == color(255,255,255)) { 
           dots.add(new PVector(x, y));
           tr = true;
           break TRLoop;
        }
      }
    }
    
    if ( !tr ) dots.add(new PVector(maxx-25, miny+25));
    
    BLLoop:
    for ( int x = minx; x < quadrantx - quadrant_threshold; x += 1 ){ 
      for ( int y = maxy; y > quadranty + quadrant_threshold; y -= 1 ){ 
        int loc = x + y * frame.width;
        color c = frame.pixels[loc];
        // if pixel is color(255,255,255):
        if ( c == color(255,255,255)) {
           dots.add(new PVector(x, y));
           bl = true;
           break BLLoop;
        }
      }
    }
    
    if ( !bl ) dots.add(new PVector(minx+25, maxy-25));
    
    BRLoop:
    for ( int x = maxx; x > quadrantx + quadrant_threshold; x -= 1 ){ 
      for ( int y = maxy; y > quadranty + quadrant_threshold; y -= 1 ){ 
        int loc = x + y * frame.width;
        color c = frame.pixels[loc];
    
        if ( c == color(255,255,255)) { 
           dots.add(new PVector(x, y));
           br = true;
           break BRLoop;
        }
      }
    }
    
   
    if (br == false){
      dots.add(new PVector(maxx-25, maxy-25));    
    }
    // Simulate the posistion of center dots
    dots.add(new PVector((minx + maxx) / 2, (miny+maxy) / 2));
  
    return dots;
}

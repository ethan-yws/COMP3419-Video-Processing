//Left Arm Class
public class LeftArm {
  PImage leftarm;
  int x;
  int y;
  
  public LeftArm(PImage img, int x, int y) {
    this.leftarm = img;
    this.x = x;
    this.y = y;
  }
  
  public void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

//Right Arm Class
public class RightArm {
  PImage rightarm;
  int x;
  int y;
  
  public RightArm(PImage img, int x, int y) {
    this.rightarm = img;
    this.x = x;
    this.y = y;
  }
  
  public void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

//Left Leg Class
public class LeftLeg {
  PImage leftleg;
  int x;
  int y;
  
  public LeftLeg(PImage img, int x, int y) {
    this.leftleg = img;
    this.x = x;
    this.y = y;
  }
  
  public void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

//Right Leg Class
public class RightLeg {
  PImage rightleg;
  int x;
  int y;
  
  public RightLeg(PImage img, int x, int y) {
    this.rightleg = img;
    this.x = x;
    this.y = y;
  }
  
  public void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

//Body Class
public class Body {
  PImage body;
  int x;
  int y;
  
  public Body(PImage img, int x, int y) {
    this.body = img;
    this.x = x;
    this.y = y;
  }
  
  public void move(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

// Drawing tool for movie poster and opening credits
// © Elena La Maida for the course SEI2014 @ UnirSM  




boolean saveF, showPoint, savePDF, showForce = false;

int num = 60; //circle size
float mousex[] = new float[num]; //variable mouse x
float mousey[] = new float[num]; //variable mouse y
void setup() {
  size(1280, 720);
  noStroke();
  fill(255, 150); 
  //background(51);
 }

void draw() {
 background(51); 
  noCursor();
  // Cycle through the array, using a different entry on each frame. 
 
  if (key =='s' || key =='S') {
    saveFrame("Animation01/anim-####.tga");
    println(frameCount);
  }
 if (savePDF) {
    endRecord();
    savePDF = false;
  }

  if (saveF) {
    saveFrame("frame-#######.tga");
  }
} 
 
 

void mouseDragged() {
 
  if (mousePressed && mouseY<width-150) { //height 40
   // Using modulo (%) like this is faster than moving all the values over.
  int light = frameCount % num; //create a variable of a circle by frames 
  mousex[light] = mouseX; 
  mousey[light] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int fascio = (light+150 +i) % num;
    ellipse(mousex[fascio], mousey[fascio], i,i); 
  }

}
  }
  
  void keyPressed() {
  if (key == DELETE || key == BACKSPACE) {
    background(255);

  }
    }

// Drawing tool for movie poster and opening credits
// © Elena La Maida for the course SEI2014 @ UnirSM  




boolean saveF, showPoint, savePDF, mode1 = false;
float trasp = 2.5;
int num =30; //circle size
float mousex[] = new float[num]; //variable mouse x
float mousey[] = new float[num]; //variable mouse y
void setup() {
  size(1280, 720);
  noStroke();
  fill(255, 2.5); 
  background(0);
  frameRate(30);
 }

void draw() {
  if (mode1) {  
     background(0); 
     fill (255); 
   } else {
     fill (255,trasp); 
   }
  
  noCursor();
  // Cycle through the array, using a different entry on each frame. 

if (mousePressed) { //height 40
   // Using modulo (%) like this is faster than moving all the values over.
  int light = frameCount % num; //create a variable of a circle by frames 
  mousex[light] = mouseX; 
  mousey[light] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int fascio = (light+2+i) % num;
    ellipse(mousex[fascio], mousey[fascio], i*1.5,i*1.5); 
  }
}
  

 if (savePDF) {
    endRecord();
    savePDF = false;
  }

  if (saveF) {
    saveFrame("Animation01/frame-#######.tga");
  }
} 
 
 

void mouseDragged() {
 
  

  }
  
  void keyPressed() {
    
    
    
  if (key == DELETE || key == BACKSPACE) {
    background(0);
  }
    if (key =='s' || key =='S') {
    saveF = !saveF;
    }
    if (key =='1') {
    mode1 = !mode1;
    }
    if (key =='3') {
    trasp -= 5;
    if (trasp<=0) trasp=2.5;
    }
    if (key == '4') {
     trasp +=5; 
     if (trasp>=250) trasp=250;
    }
    
    }

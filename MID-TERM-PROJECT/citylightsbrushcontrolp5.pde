// Drawing tool for movie poster and opening credits
// © Elena La Maida for the course SEI2014 @ UnirSM  
//with control panel p5

import controlP5.*;

ControlP5 interfaccia;


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

interfaccia = new ControlP5(this);

  // create a group for all the gui element called ADMIN
  Group ADMIN = interfaccia.addGroup("ADMIN")
    .setPosition(10, 20)
    .setWidth(200)
    .setBackgroundHeight(70)
    .setBackgroundColor(color(150))
    ;

  // create a slider for the TriangleMinSize parameter
  // name, minValue, maxValue, defaultValue, x, y, width, height
  interfaccia.addSlider("num", 10, 100, 30, 10, 10, 100, 14)
  .setGroup(ADMIN)
   ;


interfaccia.addSlider("trasp", 0, 5, 2.5, 10, 33, 100, 14)
  .setGroup(ADMIN)
   ;

  // create a toggle button to control "delete screen" or not
  interfaccia.addToggle("cancella")
    .setPosition (10,52)
    .setSize(14, 14)
    .setGroup(ADMIN)
    ;
 // setup()

 }

void draw() {
  if (mode1) {  
     background(0); 
     fill (255); 
   } else {
     fill (255,trasp); 
   }
  
//  noCursor();
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
    
    
  // ControlP5 default properties load/save key combinations are 
  // alt+shift+l to load properties
  // alt+shift+s to save properties
  // we use 1 to save setup and 2 to load setup
  if(key=='5') {
    interfaccia.saveProperties(("current_setup.ser"));
  } else if(key=='6') {
    interfaccia.loadProperties(("current_setup.ser"));
  }
 //interfaccia()
      
    }
   

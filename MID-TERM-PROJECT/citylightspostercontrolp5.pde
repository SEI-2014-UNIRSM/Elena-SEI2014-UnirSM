// Drawing tool for movie poster and opening credits
// © Elena La Maida for the course SEI2014 @ UnirSM  
//definitive code without text because created errors of PDF exportations
// with control panel p5

import processing.pdf.*;
import java.util.Calendar;
import controlP5.*;

ControlP5 interfaccia;
PImage photo;


//create boolean for PDF exporting
boolean saveF, showPoint, savePDF, showForce = false;
boolean reDraw = true;
boolean recordPDF = false; 
 
 
int num = 200; //variable of the size circle
float mousex[] = new float[num]; //array for mouseX
float mousey[] = new float[num]; //array for mouseY

void setup() {
  size(580,850 );
  photo = loadImage("City-Lights-charlie-chaplin-14440716-1600-12801.jpg");
  noStroke();
  fill(255, 150); 
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

  // create a toggle button to control "delete screen" or not
  interfaccia.addToggle("cancella")
    .setSize(14, 14)
    .setGroup(ADMIN)
    ;
 // setup()
 
 
 
 
}

void draw() {
  background(51); 
  image(photo, 0, 0);
  //noCursor();
  // Cycle through the array, using a different entry on each frame. 
 
     // Using modulo (%) like this is faster than moving all the values over.
  int light = frameCount % num; // create a variable that corresponds to my beam of light characterized by the number of frames 
   // Create the array that contains the mouse x and y values ​​with the corresponding variable in my circle
  mousex[light] = mouseX; 
  mousey[light] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int fascio = (light+1 +i) % num;
    ellipse(mousex[fascio], mousey[fascio], i,i); 
  
  }
      
  }
  



void keyPressed() { 
    
  // ControlP5 default properties load/save key combinations are 
  // alt+shift+l to load properties
  // alt+shift+s to save properties
  // we use 1 to save setup and 2 to load setup
  if(key=='1') {
    interfaccia.saveProperties(("current_setup.ser"));
  } else if(key=='2') {
    interfaccia.loadProperties(("current_setup.ser"));
  }
 //interfaccia()
      
    }
   



 
  
  // delete what I drew and recall background

 void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(0); 



  //pdf export
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "####.pdf");
      println("recording started");
      recordPDF = true;
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
    }
  }
    }

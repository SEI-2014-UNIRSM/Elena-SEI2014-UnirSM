// Drawing tool for movie poster and opening credits
// © Elena La Maida for the course SEI2014 @ UnirSM  


import processing.pdf.*;
import java.util.Calendar;

PImage photo;

PFont font; 

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
  

  //characteristics about the font
  font = loadFont("HelveticaNeue-CondensedBold-48.vlw");
  textFont (font);
  //textSize(50);  // If value increase it to me shells, then the amount larger font? 
   // but grain even if the amount of the same size
  font = createFont("HelveticaNeue-CondensedBold-48.vlw", 400); //400 is the smooth value

}

void draw() {
  background(51); 
  image(photo, 0, 0);
  noCursor();
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
  
  
  //draw the text
    text("CITY LIGHTS", 180, 680);
    text("Charlie Chaplin", 180, 750);

  }
      
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

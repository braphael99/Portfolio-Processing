//Blake Raphael
//RobotAnimation.pde
//The purpose of this program is to draw a robot and animate it based on user input

  float XChange = 0.0;
  float YChange = 0.0;
  float armChange = 0.0;
  boolean missile = false;
  boolean please = false;
  float missileChange = 0.0;
  float r = 21;
  float g = 161;
  float b = 142;
  float textR = 0;
  float textG = 0;
  float textB = 0;
  
void setup(){
  size(1000, 750);
  frameRate(61);
    
}

void draw(){
  background(255);
  
  //head ellipse
  fill(#254472);
  ellipse(width -500 + XChange, 200 + YChange, 250, 100);

  //body rectangle
  fill(r, g, b);
  rect(width - 650 + XChange, 251 + YChange, 300, 400);

  //arm / leg rectangles
  fill(#8B6C9B);
  rect(width - 750 + XChange, 600 + YChange, 100, 200);
  rect(width - 350 + XChange, 100 + armChange, 100, 200);
  rect(width - 750 + XChange, 100 + armChange, 100, 200);
  rect(width - 350 + XChange, 600 + YChange, 100, 200);
  
  //antennae circles
  fill(#72AB98);
  circle(width - 550 + XChange, 150 + YChange, 25);
  circle(width - 450 + XChange, 150 + YChange, 25);
  
  //eye circle
  fill(0, 0, 0);
  circle(width - 500 + XChange, 200 + YChange, 50);
  fill(255, 0, 0);
  circle(width - 500 + XChange, 200 + YChange, 30);
  
  //checks if missile is true to draw the missiles on the robot
  if (missile){
    
    //missile drawings
    triangle(width - 350 + XChange, 250 + missileChange, 700 + XChange, 150 + missileChange, 750 + XChange, 250 + missileChange);
    triangle(width - 750 + XChange, 250 + missileChange, 300 + XChange, 150 + missileChange, 350 + XChange, 250 + missileChange);
    rect(width - 350 + XChange, 250 + missileChange, 100, 200);
    rect(width - 750 + XChange, 250 + missileChange, 100, 200);
    
  }
  
  //checks if a key is pressed
  if(keyPressed){
    
    //if the 'd' key is pressed then the robot moves to the right
    if (key == 'd' || key == 'D'){
      
      XChange += 10;

     }
     
     //if the 'a' key is pressed, the robot moves to the left
     else if(key == 'a' || key == 'A'){
       
       XChange += -10;
     }
     
     //if the 's' key is pressed, the arm moves down
     else if(key == 's' || key == 'S'){
      
       armChange = 100;
       
     }
     
     //if the 'w' key is pressed after the 's' key has been pressed, the arms move back up
     else if(key == 'w' || key == 'W'){
       
       if (armChange == 100){
         
          armChange += -100;
          
       }
       
       //if missile is true and the 'w' key is pressed, the missiles 'fire' straight up
       if(missile){
         
         missileChange += -100;
         
       }
       
     }
     
     //if the 'e' key is pressed, the missiles are created at the robot's side
     else if(key == 'e' || key == 'E'){
      
       missile = true;
       textSize(32);
       text("Missiles activated", 100, 100);
       
     }
     
     //if the 'p' key is pressed, the please boolean is activated to create the text that the user chooses to follow the mouse
     else if(key == 'p' || key == 'P'){
       
       please = true;
       
       
     }
     
     //if the 'q' key is pressed, the boolean please is deactivated
     else if(key == 'q' || key == 'Q'){
       
       please = false;
       
     }
   }
   
   //checks if the mouse is pressed
   if(mousePressed){
    
     //if the left button is pressed,
     if(mouseButton == LEFT){
       
      fill(#C6222D);
      circle(width - 550 + XChange, 150 + YChange, 25);
      circle(width - 450 + XChange, 150 + YChange, 25);
     
      fill(#FFFFFF);
      circle(width - 500 + XChange, 200 + YChange, 50);
      fill(#08F5FF);
      circle(width - 500 + XChange, 200 + YChange, 30);
      
     }
     
     //if the right button is pressed
     else if (mouseButton == RIGHT){
       
       r = random(255); 
       g = random(255);
       b = random(255);
       
       
       
     }
   }
   
   //if the please boolean is true, then this chunk of code runs
   if(please){
    
     //checks if a key is pressed
     if(keyPressed){
      
       //if the key is R then the color value is changed for the text
       if(key == 'r' || key == 'R'){
        
         textR = random(255);
         textG = random(255);
         textB = random(255);
         
       }
       
     }
     
     //displaying the text to follow the mouse cursor
     textSize(32);
     fill(textR, textG, textB);
     text("we vibing bruh", mouseX, mouseY);
     
   }
}

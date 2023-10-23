/**   Picture Grid Drawing Activity
/*    v.20131007
/*    Bradley Beth
/*    Matthew Curtis
/*    Katherine Curtis
 */

int opacity = 255;
boolean imageShow = true;
boolean gridShow = false;
boolean loadPic = false;
boolean lineToggle = false;
int grid = 16;
int picWidth = 0;
int picHeight = 0;
int lastX = -1;
int lastY = -1;
MLine L1, L2;
PImage img;

boolean clickPos[][] = new boolean [640][480];
LineEndPoint linePos[][] = new LineEndPoint [640][480];


/* main */

void setup() 
{

  size(800, 600);
  background(185);
  textAlign(LEFT);
  textSize(16);
  imageMode(CENTER);
  ellipseMode(CENTER);
  noLoop();  

  L1 = new MLine(grid);
  L2 = new MLine(grid);
}

void draw()
{

  background(185);
  noStroke();
  fill(255);
  rect(30, 500, 130, 40, 10);
  fill(55);
  text("Upload Picture", 38, 525);


  if (gridShow)
    fill (#FFFF7D);
  else
    fill(255);
  rect(180, 475, 130, 40, 10);
  fill(55);
  text("Toggle Grid", 198, 500);


  if (imageShow)
    fill (#FFFF7D);
  else
    fill(255); 
  rect(330, 500, 130, 40, 10);
  fill(55);
  text("Toggle Picture", 338, 525);


  if (lineToggle)
    fill (#FFFF7D);
  else
    fill(255);   
  rect(480, 500, 160, 40, 10);
  fill(55);
  text("Toggle Line Mode", 490, 525);


  fill(255);
  rect(180, 525, 130, 40, 10);
  fill(55);
  textSize(40);
  text("+", 196, 557);
  text("-", 266, 557);

  stroke(0);
  line(245, 525, 245, 565);
  noStroke();
  textSize(16);

  if (imageShow && loadPic)
  { 
    fill(alpha(opacity));
    picWidth = img.width;
    picHeight = img.height;
    if (picWidth > 640)
    {
      picHeight = (int)(picHeight*(640.0/picWidth));
      picWidth = 640;
    }
    if (picHeight > 480)
    {
      picWidth = (int)(picWidth*(480.0/picHeight));
      picHeight = 480;
    }
    image(img, width/2, height/2-50, picWidth, picHeight);
  }

  if (!imageShow)
  {  
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2-50, picWidth, picHeight);
    rectMode(CORNER);
  }

  if (gridShow)
  {
    fill(0);
    stroke(152);

    L1.display();
    L2.display();
  }

  stroke(0);
  fill(0);
  for (int i = 0; i<picWidth; i++) 
    for (int j = 0; j<picHeight; j++) 
      if (clickPos[i][j]==true) {
        ellipse(width/2-picWidth/2+i, height/2-50-picHeight/2+j, 4, 4);
        if (linePos[i][j]!=null)
          line(width/2-picWidth/2+i,height/2-50-picHeight/2+j,width/2-picWidth/2+linePos[i][j].x,height/2-50-picHeight/2+linePos[i][j].y); 
      }
  
  fill(255);
  noStroke();
}

void mouseClicked() {

  if ((gridShow) && (mouseX>(width/2-picWidth/2) && mouseX<(width/2+picWidth/2) && mouseY>(height/2-50-picHeight/2) && mouseY<(height/2-50+picHeight/2)))
  {
    int drawX = grid*((mouseX-(width/2-picWidth/2)+grid/2)/grid);
    int drawY = grid*((mouseY-(height/2-50-picHeight/2)+grid/2)/grid);
    if (((abs(mouseX-drawX)>grid/3) && (abs(mouseY-drawY)>grid/3)) &&
      (drawX <= picWidth) && (drawY <= picHeight))
    {
      if ((lastX != -1) && (lastY != -1) && lineToggle)
        if ((linePos[lastX][lastY]!=null) && (linePos[lastX][lastY].x == drawX && linePos[lastX][lastY].y == drawY))
          linePos[lastX][lastY] = null;
        else
          linePos[lastX][lastY] = new LineEndPoint(drawX,drawY);
            
      clickPos[drawX][drawY]=!clickPos[drawX][drawY];
      lastX = drawX;
      lastY = drawY;
    }

    redraw();
  }
}

void mousePressed()
{

  if (mouseX>30 && mouseX<160 && mouseY>500 && mouseY<540)
  {
    redraw();
    selectInput("Select a file to process:", "fileSelected");
  }

  if (mouseX>330 && mouseX<460 && mouseY>500 && mouseY<540 && loadPic)
  {
    imageShow = !imageShow;
    redraw();
  }

  if (mouseX>180 && mouseX<310 && mouseY>475 && mouseY<515 && loadPic)
  {
    gridShow = !gridShow;
    redraw();
  }      

  if (mouseX>480 && mouseX<640 && mouseY>500 && mouseY<540 && loadPic && gridShow)
  {
    lineToggle = !lineToggle;
    lastX = -1;
    lastY = -1;
    redraw();
  }  

  if (mouseX>180 && mouseX<310 && mouseY>525 && mouseY<625 && loadPic && gridShow)
  {
    if ((mouseX<235)&&(grid<picWidth/2))
      grid*=2;
    if ((mouseX>235)&&(grid>8))
      grid/=2;
    redraw();
  }
}

void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  } 
  else 
  {
    println("User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
    loadPic = true;
    redraw();
  }
}

class MLine 
{
  MLine(int gridSize)
  {
    grid = gridSize;
  }

  void display()
  {
    fill(0);
    stroke(152);

    for (int i = width/2-picWidth/2; i <= width/2+picWidth/2; i+=grid) 
    {
      line (i, height/2-picHeight/2-50, i, height/2+picHeight/2-50);
    }
    for (int j = height/2-picHeight/2-50; j <= height/2+picHeight/2-50; j+=grid) 
    {
      line (width/2-picWidth/2, j, width/2+picWidth/2, j);
    }
    noStroke();
    fill(255);
  }
}

class LineEndPoint {

    int x, y;

    public LineEndPoint(int xx, int yy) {x = xx; y = yy;}
}


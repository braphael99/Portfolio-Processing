/*******************************************
 *                                         * 
 * Black and White                         *
 *                                         *
 * UTeach CSP                              *
 * Bradley Beth                            *
 * rev. 20160909                           * 
 *                                         *
 * Illustrate gray scale with an ellipse.  *
 *******************************************/

int blackwhite = 0;

void setup()
{
  size(600,600);
  noStroke();
  textSize(64);
}

void draw()
{
  if (blackwhite < 256)
  {
   // fill(blackwhite, 0, 0);
   // fill(0, blackwhite, 0);
   // fill(0, 0, blackwhite);
    fill(blackwhite, blackwhite, blackwhite);        // This will range from 0 to 255
    ellipse(width/2, height/2, width, height);
    fill(#BF5700);
    text(str(blackwhite),width/2,height/2);
    blackwhite = blackwhite + 1;
  }
}

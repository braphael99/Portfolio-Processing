size(640,480);

strokeWeight(16);
fill(#D9C89E);
ellipse(width / 3, height / 3, 400, 200);

line(320, 220, 340, 240);
line(340, 240, 320, 250);

fill(#00FFC1);
ellipse(width / 3, height  + 100 - 40, 20, 20);
ellipse(2 * width / 3, height - 40 - 40, 20, 20);
fill(#00FFC1);
curve(360 / 2, 100, 220, 280, 440, 280, 420, 100 / 2);
line(220, 280, 440, 280);

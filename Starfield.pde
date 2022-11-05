Particle[] bobs = new Particle[15];
void setup()
{
  size(700, 700);
  bobs[0] = new OddballParticle();
  for (int i = 0; i < bobs.length; i++) {
    bobs[i] = new Particle();
    bobs[i].myX = 350;
    bobs[i].myY = 350;
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < bobs.length; i++) {
    bobs[i].explosion();
    bobs[i].show();
  }
}
void mousePressed() {
  for (int i = 0; i < bobs.length; i++) {
    bobs[0] = new OddballParticle();
    bobs[i] = new Particle();
  }
}

class Particle
{
  double myX, myY, myAngle, mySpeed;
  int mySize, myO, myColor;
  Particle() {
    myX = mouseX;
    myY = mouseY;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*3;
    mySize = 20;
    myColor = 0;
  }
  void show() {
    noStroke();
    fill(255, 0, 0);//hat
    ellipse((float)myX, (float)myY-80, 220, 160);
    fill(#FFDBAC);

    ellipse((float)myX, (float)myY, 200, 200); //head
    ellipse((float)myX+100, (float)myY, 50, 70);//ears
    ellipse((float)myX-100, (float)myY, 50, 70);

    fill(255);//logo
    ellipse((float)myX, (float)myY-110, 75, 75);
    fill(255, 0, 0);
    ellipse((float)myX+15, (float)myY-120, 10, 40);
    ellipse((float)myX-15, (float)myY-120, 10, 40);
    ellipse((float)myX, (float)myY-120, 10, 40);
    ellipse((float)myX, (float)myY-137, 40, 10);

    fill(#4B3A26); //hair + moustache
    ellipse((float)myX+20, (float)myY+50, 50, 40);
    ellipse((float)myX-20, (float)myY+50, 50, 40);
    ellipse((float)myX+50, (float)myY+40, 50, 40);
    ellipse((float)myX-50, (float)myY+40, 50, 40);
    ellipse((float)myX+90, (float)myY-30, 20, 60);
    ellipse((float)myX-90, (float)myY-30, 20, 60);

    fill(200, 0, 0); //lid
    ellipse((float)myX, (float)myY-60, 200, 50);
    fill(230, 0, 0);
    ellipse((float)myX, (float)myY-70, 200, 50);

    fill(#F1C27D); //nose
    ellipse((float)myX, (float)myY+30, 50, 50);
    fill(#FFDBAC);
    ellipse((float)myX+5, (float)myY+25, 45, 45);

    fill(myColor);  //eyes
    ellipse((float)myX+30, (float)myY-10, 30, 50);
    ellipse((float)myX-30, (float)myY-10, 30, 50);
  }
  void explosion() {
    myX += (Math.cos(myAngle) * mySpeed);
    myY += (Math.sin(myAngle) * mySpeed);
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {
    myX = myY;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = (int)(Math.random()*2)+2;
    myColor = color((int)(Math.random()*255)+150, 0, 0);
    mySize = 50;
  }
}

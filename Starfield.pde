Particle[] nazo;
void setup()
{
  //your code here

  size(500, 500);
  nazo = new Particle[1100];
  for (int i = 0; i < nazo.length; i++) {
    nazo[i] = new NormalParticle();
  }
  nazo[1099] = new OddballParticle();
  nazo[0] = new JumboParticle();

}
void draw()
{
  //your code here
  background(0);
  for (int i = 0; i < nazo.length; i++) {
    nazo[i].show();
    nazo[i].move();
  }
}
class NormalParticle implements Particle
{
  public double myX, myY, daSpeed, daAngle;
  int Rgb;
  NormalParticle ()
  {
    myX = myY = 250;
    daSpeed = Math.random()*10;
    daAngle = Math.PI*2*Math.random();
    Rgb = color(0, (int)(Math.random()*256), (int)(Math.random()*56));
  }
  void move() {
    myX += daSpeed * cos((float)daAngle);
    myY += daSpeed * sin((float)daAngle);
    daAngle += 0.01;
  }
  void show() {
    noStroke();
    fill(Rgb);
    rect((float)myX, (float)myY, 7, 7);
  }
}
interface Particle
{
  //your code here
  public void show();
  public void move();
}
class OddballParticle implements Particle//uses an interface
{
  //your code here
  double myX, myY, daSpeed, daAngle;
  int myColor;
  public void move() {
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myX += daSpeed + cos((float)daAngle);
    myY += daSpeed + sin((float)daAngle);
    daAngle += 1;
  }
  public void show() {
    fill (myColor);
    ellipse((float)(myX)+250, (float)(myY)+250, 100, 100);
  }
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill(255,0,0);
    rect((float)myX, (float)myY, 35, 35);
  }
} //uses inheritance

SpaceShip ship;
Star [] star = new Star [100]; 
ArrayList <Asteroid> List;
public void setup() 
{
  size(600,600);
  ship = new SpaceShip();
  for(int i=0; i<star.length; i++)
  {
    star[i] = new Star();
  }
  List = new ArrayList <Asteroid>();
  for(int i=0; i<=20;i++)
  {
    List.add(new Asteroid());
  }
} 
public void draw() 
{
  background(0,0,0);
  for(int i=0; i<star.length; i++)
  {
    star[i].show();
  }
  for(int i=0; i<List.size();i++)
  {
    List.get(i).show();
    List.get(i).move();
  }
  ship.move();
  ship.show();
  for(int i=0; i<List.size();i++)
    if(dist(ship.getX(),ship.getY(),List.get(i).getX(),List.get(i).getY())<20)
      List.remove(List.get(i));
}
public void keyPressed()
{
  if(key== 'k' || key== 'K')
  {
    ship.setX((int)(Math.random()*600));
    ship.setY((int)(Math.random()*600));
    ship.setPointDirection((int)(Math.random()*360));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
  }
  if(key== 'w' || key== 'W')
  {
    ship.accelerate(.2);
  }
  if(key== 'a' || key== 'A')
  {
    ship.rotate(-6);
  }
  if(key== 'd' || key== 'D')
  {
    ship.rotate(6);
  }
  if(key== 's' || key=='S')
  {
    ship.accelerate(-.2);
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners = 23;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0]=-4;
    yCorners[0]=-8;
    xCorners[1]=-2;
    yCorners[1]=-8;
    xCorners[2]=0;
    yCorners[2]=-4;
    xCorners[3]=3;
    yCorners[3]=-4;
    xCorners[4]=3;
    yCorners[4]=-3;
    xCorners[5]=7;
    yCorners[5]=-2;
    xCorners[6]=10;
    yCorners[6]=-2;
    xCorners[7]=11;
    yCorners[7]=-1;
    xCorners[8]=15;
    yCorners[8]=0;
    xCorners[9]=11;
    yCorners[9]=1;
    xCorners[10]=10;
    yCorners[10]=2;
    xCorners[11]=7;
    yCorners[11]=2;
    xCorners[12]=3;
    yCorners[12]=3;
    xCorners[13]=3;
    yCorners[13]=4;
    xCorners[14]=0;
    yCorners[14]=4;
    xCorners[15]=-2;
    yCorners[15]=8;
    xCorners[16]=-4;
    yCorners[16]=8;
    xCorners[17]=-2;
    yCorners[17]=5;
    xCorners[18]=-6;
    yCorners[18]=1;
    xCorners[19]=-6;
    yCorners[19]=-1; 
    xCorners[20]=-2;
    yCorners[20]=-5;
    myColor= color(255,0,0);
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }
    public void setX(int x) {myCenterX=(double)x;}
    public int getX() {return (int)myCenterX;}   
    public void setY(int y) {myCenterY=(double)y;}   
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX=x;}
    public double getDirectionX() {return myDirectionX;}    
    public void setDirectionY(double y) {myDirectionY=y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection=degrees;}
    public double getPointDirection() {return myPointDirection;}
}
class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    rotSpeed=(int)(Math.random()*10);
    corners = 14;
    int xS[]={-8,-8,-6,-6,2,4,7,10,10,9,4,-3,-4,-5};
    int yS[]={-2,4,7,8,9,9,7,3,-3,-3,-8,-7,-5,-5};
    xCorners=xS;
    yCorners=yS;
    myColor= color(255,255,255);
    myCenterX=(int)(Math.random()*600);
    myCenterY=(int)(Math.random()*600);
    myDirectionX=(int)(Math.random()*4)-2;
    myDirectionY=(int)(Math.random()*4)-2;
    myPointDirection=0;
  }
  public void setX(int x) {myCenterX=(double)x;}
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY=(double)y;}   
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX=x;}
  public double getDirectionX() {return myDirectionX;}    
  public void setDirectionY(double y) {myDirectionY=y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection=degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x); 
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY(); 
  abstract public void setDirectionX(double x); 
  abstract public double getDirectionX();    
  abstract public void setDirectionY(double y); 
  abstract public double getDirectionY();    
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()     //draws the floater at the current position 
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Star
{
  private int x,a,b;
  public Star ()
  { x = 400;
    a = (int)(Math.random()*600);
    b = (int)(Math.random()*600);
  }
  public void show()
  {
    fill(255,255,255);
    ellipse((float)a,(float)b, (float)5, (float)5);
  }
}

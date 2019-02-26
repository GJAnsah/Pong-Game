//Started: February 6 2019
//Name: Pong Game



//variable declaration for ball center coordinates (x and y), ball diameter, starting coordinate of left and right paddles, paddle dimensions, score positions, text size and player scores
float ballX, ballY , Diameter, lPaddleX, lPaddleY, rPaddleX, rPaddleY, pHeight, pWidth, lScoreX, lScoreY, rScoreX, rScoreY, tSize;
int rScore, lScore;
boolean gameOn; //boolean varible to start game if true
// player scores are integers because we count score in integers. We want to see decimal zeros.
//Other values are floats because the screen dimensions may be floating points and all those variables are dependent on the screen size.
int xSpeed, ySpeed; //variables for change and x and y coordinates of ball
void setup() //runs once
{
    //initialization 
    ballX = width/2;
    ballY = height/2;
    Diameter =width/15;
    lPaddleX = 0;
    lPaddleY =0;
    rPaddleX = width-width/10;
    rPaddleY = height/2;
    pHeight = height/2;
    pWidth =width/10;
    lScore= 0;
    rScore=0;
    xSpeed = -3;
    ySpeed = -5;
    tSize = width/25;
    rScoreX = width/2+150;
    rScoreY = height/2;
    lScoreX = width/2-150;
    lScoreY = height/2;
    //-----------------------
    
    fullScreen (); //sets full screen
    background(0); // sets background to black;
    stroke (0); //sets shapes outline to black
    textSize (tSize); //sets texts siz
    //no fill function because different shapes will have different colors
}

void draw() //loops until program is stopped
{
    background(0); // this clears the screen and redraws shapes each time.to prevent the bal trail from.showing as it moves.
  
    // Drawing paddles
    fill (255,0,0); // paddle color red
    rect (lPaddleX, lPaddleY,pWidth,pHeight); //left paddle
    rect (rPaddleX, rPaddleY,pWidth,pHeight); //right paddle
  
    //Drawing ball
    fill (255); //ball color green
    ellipse (ballX,ballY, Diameter, Diameter); // ball with initialized diameter
  
    //Adding text
    fill (255); //text color white
    text (rScore,rScoreX,rScoreY);
    text (lScore,lScoreX, lScoreY);
    
    //checking to start game if screen is touched
    if (mousePressed)
    {
      gameOn=true;
    }
    //movingball if game starts
    if (gameOn)
    {
    
     //movingball
     ballX+=xSpeed;
     ballY += ySpeed;
     
  
    }
    //reversing direction if ball hits top or down wall
    if(ballY-(Diameter/2) < 0 || ballY+Diameter/2 >height)
    {
      ySpeed*=-1;
      
    }
    //restarting game if ball hits left wall
    if(ballX-(Diameter/2) < 0)
    {
      gameOn = false;
      ballX=width/2;
      ballY = height/2;
      rScore+=1; //increase right score
    }
    //restarting game if ball hits right 
    if(ballX+Diameter/2 >width)
    {
      gameOn=false;
      ballX=width/2;
      ballY = height/2;
      lScore+=1; //increase left score
    }

}
  
  

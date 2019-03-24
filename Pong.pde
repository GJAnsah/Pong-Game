
//Started: February 6 2019
//Name: Pong Game



//variable declaration for ball center coordinates (x and y), ball diameter, radius, starting coordinate of left and right paddles, paddle dimensions, score positions, text size and player scores
float ballX, ballY , Diameter, radius, lPaddleX, lPaddleY, rPaddleX, rPaddleY, pHeight, pWidth, lScoreX, lScoreY, rScoreX, rScoreY, tSize;
int rScore, lScore;
boolean gameOn, leftTouch, rightTouch; //boolean varibles to start game if true, check if left and paddles are touched.
// player scores are integers because we count score in integers. We want to see decimal zeros.
//Other values are floats because the screen dimensions may be floating points and all those variables are dependent on the screen size.
int xSpeed, ySpeed; //variables for change and x and y coordinates of ball
void setup() //runs once
{
    //initialization 
    ballX = width/2;
    ballY = height/2;
    Diameter =width/20;
    radius=Diameter/2;
    lPaddleX = 0;
    lPaddleY =0;
    rPaddleX = width-width/20;
    rPaddleY = height/2;
    pHeight = height/2;
    pWidth = width/20;
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
    textSize (tSize); //sets texts size
    
}

void draw() //loops until program is stopped
{
    background(0); // this clears the screen and redraws shapes each time.to prevent the bal trail from.showing as it moves.
    movePaddles();
    displayPaddles();
    displayBall();
    displayScores();
    setGameMode();
    moveBall();
    //bouncing off left paddle
    leftTouch= checkLeftPaddle(radius,ballX,ballY,pWidth,pHeight,lPaddleX,lPaddleY);
    if (leftTouch)
    {
      xSpeed*=-1;
      
    }
    //bouncing off right paddle
    rightTouch= checkRightPaddle(radius,ballX,ballY,pWidth,pHeight,rPaddleX,rPaddleY);
    if (rightTouch)
    {
      xSpeed*=-1;  
    }
    checkWall();
    

}
  void movePaddles() //function to move paddles.
  {
    if (mouseX>width/2) //moving right paddle if right side of screen is touched
    {
      rPaddleY=constrain(mouseY,0,height-pHeight); //constraining paddle to screen window.
    }
    else //moving left paddle if above condition is false.
    {
      lPaddleY=constrain(mouseY,0,height-pHeight);
    }
  }
  
  boolean checkLeftPaddle(float radius,float checkX, float checkY, float w, float h, float x, float y)
  {
    
    float leftEnd = checkX-radius;
    float bottomEnd = checkY+radius;
    float rightEnd = checkX+radius;
    float topEnd = checkY-radius;

    if (bottomEnd >= y //Check if below rectangle top
    && topEnd <= y+h //Check if above rectange bottom
    && leftEnd <= x+w //Check if left of rectangle right
    && rightEnd >= x ) //Check if right of rectangle left
    {   
        return true;
    }

    return false;
  }
  
 boolean checkRightPaddle(float radius,float checkX, float checkY, float w, float h, float x, float y)
  {
    
    float leftEnd = checkX-radius;
    float bottomEnd = checkY+radius;
    float rightEnd = checkX+radius;
    float topEnd = checkY-radius;

    if (bottomEnd >= y //Check if below rectangle top
    && topEnd <= y+h //Check if above rectange bottom
    && leftEnd <= x+w //Check if left of rectangle right
    && rightEnd >= x ) //Check if right of rectangle left
    {   
        return true;
    }

    return false;
  }
  
  void displayBall()
  {
    fill (0,0,255); //ball color blue
    ellipse (ballX,ballY, Diameter, Diameter); // ball with initialized diameter
  }
  void displayPaddles()
  {
    fill (255,255,0); // paddle color red
    rect (lPaddleX, lPaddleY,pWidth,pHeight); //left paddle
    rect (rPaddleX, rPaddleY,pWidth,pHeight); //right paddle
  }
  void displayScores()
  {    
    fill (255); //text color white
    text (rScore,rScoreX,rScoreY);
    text (lScore,lScoreX, lScoreY);
  }
  void setGameMode()
  {
    //checking to start game if screen is touched
    if (mousePressed)
    {
      gameOn= true;
    }
    
  }
  void moveBall()
  {
    //movingball if game starts
    if (gameOn)
    {
    
     //movingball
       ballX	+=xSpeed;
       ballY += ySpeed;
     
    }
  }
  void checkWall()
  {
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

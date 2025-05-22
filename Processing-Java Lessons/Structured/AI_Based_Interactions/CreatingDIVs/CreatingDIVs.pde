/* Drawing DIVs, Instructions
 - Note: Quit Button is Active
 - Print Screen to save values and image, then double click the Quit Button
 - Click and Hold to draw a DIV
 - Move it to where you want it on the screen
 - Release the DIV
 - Click the DIV to resize, hold and move the mouse, release to change the size
 - Repeat to create all DIVs
 - Key Board to Activate MousePressed Delete
 //
 - Review data array date structure
 - Intermetidate Level: rewrite to access specific arrays
 - Introductory Level: rewrite to primitive float variables
 //
 - Note: this program illustrates how an AI might deliever an output
 - Written at an Intermeidate Level
 */
//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
//int numberOfSoundEffects = ???
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong = numberOfSongs - numberOfSongs; //ZERO
//
int appWidth, appHeight;
Boolean quitDoubleClick=false;
color colour, black=#000000, red=#FF0000, white=#FFFFFF;
float beginningRectButtonX, beginningRectButtonY, beginningRectButtonWidth, beginningRectButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
int rectNumber=0, rectWidthChange=0, rectHeightChange=0, deleteThisRect=0;
float newX, newXTemp, newY, newYTemp, newWidth, newWidthTemp, newHeight, newHeightTemp;
Boolean drawNewRect=false, drawAllRects=false, resizeWidth=false, resizeHeight=false;
Boolean deleteRectActivated=false;
float[] divX = new float[rectNumber+1];
float[] divY = new float[rectNumber+1];
float[] divWidth = new float[rectNumber+1];
float[] divHeight = new float[rectNumber+1];
//
void setup() {
  //Display
  //fullScreen();
  size(700, 500);
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  int shorterSide = ( appWidth >= appHeight ) ? appHeight : appWidth ;
  //
  //Music Loading - STRUCTURED Review
  minim = new Minim(this);
  String lessonDependanciesFolder = "Lesson Dependancies Folder/";
  String musicPong = "Music Pong/";
  String pongWorld = "Pong World";
  String fileExtension_mp3 = ".mp3";
  //
  String musicDirectory = "../../../../" + lessonDependanciesFolder + musicPong;
  String file = musicDirectory + pongWorld + fileExtension_mp3; //relative pathway or directory
  playList[ currentSong ] = minim.loadFile( file ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library
  //Music Testing
  playList[currentSong].play();
  //
  //Population
  newY = newX = quitButtonY = beginningRectButtonY = beginningRectButtonX = shorterSide*0;
  newWidth = newHeight = beginningRectButtonHeight = beginningRectButtonWidth = shorterSide*1/10;
  quitButtonHeight = quitButtonWidth = shorterSide*1/20;
  quitButtonX = appWidth - (shorterSide*1/20);
  //
  //rect(X, Y Width, Height);
  rect(beginningRectButtonX, beginningRectButtonY, beginningRectButtonWidth, beginningRectButtonHeight);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  //
} //End setup
//
void draw() {
  background(black);
  rect(beginningRectButtonX, beginningRectButtonY, beginningRectButtonWidth, beginningRectButtonHeight);
  //
  //drawingRect();
  if ( drawNewRect==true ) {
    newX = mouseX;
    newY = mouseY;
    rect( newX, newY, newWidth, newHeight );
  }
  for ( int i=0; i<rectNumber; i++ ) {
    if ( rectNumber>0 ) rect( divX[i], divY[i], divWidth[i], divHeight[i] );
  }
  //
  //Misc
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) {
    colour = red;
  } else {
    colour = white;
  }
  fill(colour);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  fill(white);
  //
} //End draw
//
void mousePressed() {
  //mouseX> && mouseX< && mouseY> && mouseY<
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) {
    if ( quitDoubleClick==false ) {
      for ( int i=0; i<rectNumber; i++ ) {
        println("Rectangle", i + " (%):", int( (divX[i]/appWidth)*100 ), int( (divY[i]/appHeight)*100 ), int( (divWidth[i]/appWidth)*100 ), int( (divHeight[i]/appHeight)*100 ) );
      }
    }
    noLoop(); //First QUIT Click enables printScreen in OS
    if ( quitDoubleClick==true ) exit(); //Second QUIT Closes CANVAS
    quitDoubleClick=true;
  } //End Quit Button
  if ( mouseX>beginningRectButtonX && mouseX<beginningRectButtonX+beginningRectButtonWidth && mouseY>beginningRectButtonY && mouseY<beginningRectButtonY+beginningRectButtonHeight ) {
    drawNewRect=true;
  } //End Rect() Grab
  //
  //Resize Width & Height
  for ( int i=0; i<rectNumber; i++ ) {
    if ( mouseX>divX[i] && mouseX<divX[i]+divWidth[i] && mouseY>divY[i] && mouseY<divY[i]+divHeight[i] ) {
      resizeWidth=resizeHeight=true;
      newXTemp = mouseX;
      newYTemp = mouseY;
      newWidthTemp = divWidth[i];
      newHeightTemp = divHeight[i];
      rectWidthChange = rectHeightChange = i;
      deleteRectActivated=true;
      deleteThisRect=i;
    }
  }
  //
} //End mousePressed
//
void mouseReleased() {
  if ( drawNewRect==true ) {
    divX[rectNumber] = newX;
    divY[rectNumber] = newY;
    divWidth[rectNumber] = newWidth;
    divHeight[rectNumber] = newHeight;
    newX = newY = 0;
    drawNewRect = false;
    rectNumber++;
    divX = append(divX, 0);
    divY = append(divY, 0);
    divWidth = append(divWidth, 0);
    divHeight = append(divHeight, 0);
  } //End Placing Rectangle
  //
  if ( resizeWidth==true ) {
    divWidth[rectWidthChange] = newWidthTemp + ( mouseX-newXTemp ) ;
    resizeWidth=false;
  } //End Resize Width
  if ( resizeHeight==true ) {
    divHeight[rectHeightChange] = newHeightTemp + ( mouseY-newYTemp );
    resizeHeight=false;
  } //End Resize Height
  //
} //End Mouse Release
//
void keyPressed() {
  //Currently deletes most recent rectangle, nothing more
  divX = shorten(divX);
  divY = shorten(divY);
  divWidth = shorten(divWidth);
  divHeight = shorten(divHeight);
  rectNumber--;
  //
} //End keyPressed
//
// End Main Program

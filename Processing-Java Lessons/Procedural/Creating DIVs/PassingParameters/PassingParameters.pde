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
import java.io.File;
//
//Global Variables
//
void setup() {
  //
  //fullScreen();
  size(700, 500);
  displaySetup();
  //
  musicPlayerSetup();
  populationSetup();
  //divSetup();
  //
} //End setup
//
void draw() {
  //
  drawButtons();
  drawingDIVs();
  //
} //End draw
//
void mousePressed() {
  mousePressedQuitButton();
  activatingDIV_Movement_mousePressed();
  //Then mouse releases DIV at the intended X & Y
  //See Mouse Released
  //
  //Mouse can then resize the DIV in any direction
  resizeDIV_WidthAndHeight_mousePressed();
  //
} //End mousePressed
//
void mouseReleased() {
  placingDIV_XYPosition_mouseReleased();
} //End Mouse Release
//
void keyPressed() {
  deletingLastDIV_keyPressed();
} //End keyPressed
//
// End Main Program

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
void drawButtons() {
  background(black);
  divButton();
  quitButton();
  //
} //End Draw Buttons
//
void divButton() {
  rect(beginningRectButtonX, beginningRectButtonY, beginningRectButtonWidth, beginningRectButtonHeight);
} //End DIV Button
//
void quitButton() {
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
} //End Quit Button
//
void mousePressedQuitButton() {
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
} //End Mouse Pressed Quit Button
//
void activatingDIV_Movement_mousePressed() {
  if ( mouseX>beginningRectButtonX && mouseX<beginningRectButtonX+beginningRectButtonWidth && mouseY>beginningRectButtonY && mouseY<beginningRectButtonY+beginningRectButtonHeight ) {
    drawNewRect=true;
  } //End Rect() Grab
} //End Activating DIV Movement
//
void placingDIV_XYPosition_mouseReleased() {
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
} //End Playing the DIV
//
void resizeDIV_WidthAndHeight_mousePressed() {
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
} //End Resize DIV with Mouse Movement
//
void deletingLastDIV_keyPressed() {
  //Currently deletes most recent rectangle, nothing more
  divX = shorten(divX);
  divY = shorten(divY);
  divWidth = shorten(divWidth);
  divHeight = shorten(divHeight);
  rectNumber--;
  //
} // End Delete Last DIV Key Pressed

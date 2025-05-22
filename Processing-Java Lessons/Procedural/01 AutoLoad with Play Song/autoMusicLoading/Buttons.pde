Boolean quitDoubleClick=false;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
color colour, black=#000000, red=#FF0000, white=#FFFFFF;
//
void drawButtons() {
  background(black);
  quitButton();
  //
} //End Draw Buttons
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
    exit();
  } //End Quit Button
} //End Mouse Pressed Quit Button
//
//End Buttons Subprogram

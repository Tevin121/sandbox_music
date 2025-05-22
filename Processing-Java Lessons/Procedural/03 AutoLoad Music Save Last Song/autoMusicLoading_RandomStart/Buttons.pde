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
    if ( quitDoubleClick==false ) {
      println("Saving Strings .txt");
      saveCurrentSong();
    }
    noLoop(); //First QUIT Click enables printScreen in OS
    if ( quitDoubleClick==true ) exit(); //Second QUIT Closes CANVAS
    quitDoubleClick=true;
  } //End Quit Button
} //End Mouse Pressed Quit Button
//
void saveCurrentSong() {
  String[] number = { str(currentSong) }; //element ZERO
  saveStrings(saveTxtPath_currentSong, number);
  println("Saved current song: " + currentSong);
  String[] dataBoolean = { str(randomStart) };
  saveStrings(saveTxtPath_randomStart, dataBoolean);
  println("Saved Random Start: " + randomStart);
}// End Save currentSong
//
//End Buttons Subprogram

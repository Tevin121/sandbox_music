//
void drawingDIVs() {
  movingNewDIV();
  drawingNewDIV();
} //End Drawing DIVs
//
void movingNewDIV() {
  if ( drawNewRect==true ) {
    newX = mouseX;
    newY = mouseY;
    rect( newX, newY, newWidth, newHeight );
  }
} //End Moving New DIV
//
void drawingNewDIV() {
  for ( int i=0; i<rectNumber; i++ ) {
    if ( rectNumber>0 ) rect( divX[i], divY[i], divWidth[i], divHeight[i] );
  }
} // End Drawing New DIV
//

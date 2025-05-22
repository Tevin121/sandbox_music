int appWidth, appHeight, shorterSide;
//
void displaySetup() {
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  shorterSide = int(comparisonReturnBigger( float(appWidth), float(appHeight) ) );
} //End Display Setup
//

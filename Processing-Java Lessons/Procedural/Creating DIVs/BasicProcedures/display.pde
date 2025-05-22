int appWidth, appHeight, shorterSide;
//
void displaySetup() {
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  shorterSide = (appWidth >= appHeight) ? appHeight : appWidth ;
} //End Display Setup
//

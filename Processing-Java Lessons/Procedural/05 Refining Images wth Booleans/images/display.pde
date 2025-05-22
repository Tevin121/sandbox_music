// Note: even though Variable do between subprograms, would be nice if they were "local" variables
//
int appWidth, appHeight, shorterSide;
//
void display() {
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  shorterSide = int(comparisonReturnSmaller( float(appWidth), float(appHeight) ) );
  //
} //End Display
//
//End Subprogram

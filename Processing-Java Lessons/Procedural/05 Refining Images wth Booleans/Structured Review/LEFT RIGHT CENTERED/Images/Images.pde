/* Dynamic Programming
 - Image Resampling is a binary algorithm with mulitple choices
 - Coloring the DIV inroduces GUI design & spacing & Hexidecimal or RGB
 - CAUTION: Square Geomtery ERROR
 */
//
//Library - Minim
//
//Global Variables
int appWidth, appHeight;
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
float imageXChanged, imageYChanged, imageWidthChanged, imageHeightChanged;
//
PImage myFirstImage, mySecondImage;
//
color red=#FF0000, resetColour=#FFFFFF; //Use File / Tools / Color Selctor
//
void setup() {
  //Display
  //fullScreen(); //Difficult setting with Infinite Loops
  size(700, 500); //Testing Only
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  //
  //Population
  imageDivX = appWidth*1/4;
  imageDivY = appHeight*1/10;
  imageDivWidth = appWidth*1/2;
  imageDivHeight = appHeight*4/5;
  //
  //Image Aspect Ratio Algorithm: demonstrating Landscape to Portrait
  String upArrow = "../../../../../../";
  String folders = "Lesson Dependancies Folder/Images/";
  String bike = "bike";
  String oldMan = "Old man portrait";
  String fileExtensionJPG = ".jpg";
  String fileExtensionPNG = ".png";
  String myFirstImagePathway = upArrow + folders + bike + fileExtensionJPG;
  String mySecondImagePathway = upArrow + folders + oldMan + fileExtensionPNG;
  println(myFirstImagePathway);
  println(mySecondImagePathway);
  myFirstImage = loadImage( myFirstImagePathway );
  mySecondImage = loadImage( mySecondImagePathway );
  int myFirstImageWidth = 860;
  int myFirstImageHeight = 529;
  int mySecondImageWidth = 2800;
  int mySecondImageHeight = 3500;
  float imageAspectRatio_GreaterOne = ( mySecondImageWidth >= mySecondImageHeight ) ? float(mySecondImageWidth)/float(mySecondImageHeight) : float(mySecondImageHeight)/float(mySecondImageWidth) ; // Choice x / for bigger or smaller
  println(imageAspectRatio_GreaterOne);
  Boolean imageLandscape = ( mySecondImageWidth >= mySecondImageHeight ) ? true : false ;
  /*Only the image geometry needs to be know for the algorithm below
   - When the Geometries change, big dimension to small dimension must happen or image will not fit
   - still need an ERROR-Check with oddly shaped landscape-landscape, protrait-portrait resampling
   - size-decreasing algorithms (resampling) discussed in Text
   */
  if ( imageLandscape==true ) {
    imageWidthChanged = imageDivWidth;
    imageHeightChanged = ( mySecondImageWidth > imageDivWidth ) ? imageWidthChanged/imageAspectRatio_GreaterOne : imageWidthChanged*imageAspectRatio_GreaterOne ; //CAUTION: square geometry ERROR
    if ( imageHeightChanged > imageDivHeight ) { //ERROR Catch
      println("Image Aspect Ratio algorithm ERROR"); //After Proceudres, catch with Height-Calc-First Algorithm
      exit();
    }
    //TOP BOTTOM CENTERED
  } else {
    imageHeightChanged = imageDivHeight;
    imageWidthChanged = ( mySecondImageHeight >= imageDivHeight ) ? imageHeightChanged/imageAspectRatio_GreaterOne : imageHeightChanged*imageAspectRatio_GreaterOne ;
    if ( imageWidthChanged > imageDivWidth ) { //ERROR Catch
      println("Image Aspect Ratio algorithm ERROR");
      exit();
    }
    //LEFT RIGHT CENTERED
    imageYChanged = imageDivY;
    float leftOverWidth = ( imageDivWidth - imageWidthChanged ) *1/2;
    imageXChanged = imageDivX + leftOverWidth ;
  }
  //
  //DIV red resetColour
  fill(red);
  rect( imageDivX, imageDivY, imageDivWidth, imageDivHeight );
  fill(resetColour);
  //
  //Prototype Images
  image( mySecondImage, imageXChanged, imageYChanged, imageWidthChanged, imageHeightChanged );
  //
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program

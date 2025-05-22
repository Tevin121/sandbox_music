/* Text - Static Testing of a Font: elminates need to guess the font size using a ratio
 - Drawing Text: like drawing an image
 - Drawing Text means text should be a variable
 - Aspect Ratio of different Fonts includes white space around letters of Font
 - Note: white space, including of font foreground, affect emotional interpretation & cultural interpretation
 - Reminder: use print() & println() to inspect variables
 */
//
String title = "Wahoo! Spring is Awesome";
//
//Display
//fullScreen();
size(700, 500);
int appWidth = width; //displayWidth
int appHeight = height; //displayHeight
int shorterSide = ( appWidth >= appHeight ) ? appHeight : appWidth ; //Landscape, Portrait, & Square
//
//println("Start of Console");
//Fonts from OS
/*
  String[] fontList = PFont.list(); //To list all fonts available on system
 printArray(fontList); //For listing all possible fonts to choose, then createFont
 */
float fontSize = shorterSide; //changed int to float for strongly formatted language
PFont titleFont = createFont ("Harrington", 55); //Verify font exists
//Tools / Create Font / Find Font / Do Not Press "OK", known bug
//
//Layout with a rect()
float titleX = appWidth*1.5/5;
float titleY = appHeight*1/10;
float titleWidth = appWidth*2/5; //Origonal 40% = 2/5
float titleHeight = appHeight*1/10; //Origonal 10% = 1/10 //Alternative, enter actual pixel number
rect(titleX, titleY, titleWidth, titleHeight);
//
//Font Size relative to rect(height)
fontSize = 52; //Change the number until it fits, largest font size, int only to ease guessing
println("Font Size:", fontSize );
//
/* Aspect Ratio Manipulations (changes to variables)
 - choose Aspect Ratio that must be mutliplied: fontSize/titleHeight
 - Rewriting fontSize with formulae
 - Done before text(String) so all fonts same size
 */
float harringtonAspectRatio = fontSize / titleHeight;
fontSize = titleHeight*harringtonAspectRatio;
println("Aspect Ratio:", harringtonAspectRatio);
println(); //Skip a line
//
// IF with Assignment Operator decreasing percent to illustrate WHILE
//
//Minimum Lines of code to format and draw text with colour
color purpleInk = #2C08FF;
fill(purpleInk); //Ink, hexidecimal copied from Color Selector
textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
//Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
textFont(titleFont, fontSize); //see variable note
//textFont() has option to combine font declaration with textSize()
//Drawing Text
text(title, titleX, titleY, titleWidth, titleHeight);
color whiteInk = #FFFFFF;
fill(whiteInk); //reset
//
//Aspect Ratio of Specfic Font, calculations only to be entered in variables above
println( "Text Width:", textWidth(title), "v rectWidth:", titleWidth ); //Always smaller or cut off, if text is drawn, always drawn
println( "Text Height:", fontSize, "v. rectHeight:", titleHeight ); //largest fontSize that will be draw, relative to rectHeight
println( "Harrington Aspect Ratio ( fontSize/rect(height) ):", fontSize/titleHeight ); //Remember casting

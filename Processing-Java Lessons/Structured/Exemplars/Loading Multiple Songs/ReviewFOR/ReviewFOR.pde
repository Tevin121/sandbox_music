import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 8; //Able to Autodetect based on Pathway
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
void setup()
{
  minim = new Minim(this);
  // Load Music
  String lessonDependanciesFolder = "Lesson Dependancies Folder/";
  String musicPong = "Music Pong/";
  String musicAll = "Music All/";
  //Note: Download music and sound effects, then design your player with images, text, and 2D shapes
  //See Google Search: Atari pong logo free image download
  String pongWorld = "Pong World";
  //Add all files, CS20 Review is special OS Java Library
  //Including the reading of the number of files in the array
  //Alphebetical order, same as OS ordering files
  String beatYourCompetition = "Beat_Your_Competition";
  String cycles = "Cycles";
  String eureka = "Eureka";
  String ghostWalk = "Ghost_Walk";
  String groove = "groove";
  String newsroom = "Newsroom";
  String startYourEngines = "Start_Your_Engines";
  String theSimplest = "The_Simplest";
  String fileExtension_mp3 = ".mp3";
  //
  //Add Reading into Array
  String musicDirectory = "../../../../../" + lessonDependanciesFolder + musicAll; //musicPong
  //Create a FOR loop to loadFile() a changing songName, Create a Procedure with two Arrays first
  //
  /* Repeated Code
   file = directory + SONG NAME + mp3FileName;
   song[currentSong] = minim.loadFile( file ); //Minim not installed, ERROR should be seen here
   */
   //
  String file=""; //Must initialize and populate a var first seen in an IF
  for (int i=0; i<numberOfSongs; i++) {
    if (i==0) file = musicDirectory + groove + fileExtension_mp3;
    if (i==1) file = musicDirectory + startYourEngines + fileExtension_mp3;
    if (i==2) file = musicDirectory + beatYourCompetition + fileExtension_mp3;
    if (i==3) file = musicDirectory + cycles + fileExtension_mp3;
    if (i==4) file = musicDirectory + eureka + fileExtension_mp3;
    if (i==5) file = musicDirectory + ghostWalk + fileExtension_mp3;
    if (i==6) file = musicDirectory + newsroom + fileExtension_mp3;
    if (i==7) file = musicDirectory + theSimplest + fileExtension_mp3;
    playList[i] = minim.loadFile( file );
  }
  //
  currentSong = 0; //Purpose: song testing
  //
  playList[currentSong].play(); //Purpose: song testing
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

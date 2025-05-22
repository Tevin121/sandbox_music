//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
import java.io.File;
//
//Global Variables
int appWidth, shorterSide;
//
String saveTxtPath_currentSong; //For Saving Last Known Song Played
//
Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
//int numberOfSoundEffects = ???
AudioPlayer[] playList; //length of array determined by reading the Music Folder
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong; //Reads .txt file to populate last known song
//
void setup() {
  //
  //fullScreen();
  size(700, 500);
  appWidth = width; //displayWidth
  int appHeight = height; //displayHeight
  shorterSide = int(comparisonReturnSmaller( float(appWidth), float(appHeight) ) );
  //
  //Saving Last Known Song Played
  // Initialize the save file path
  saveTxtPath_currentSong = sketchPath("currentSong.txt");
  println(saveTxtPath_currentSong);
  //
  populationSetup();
  //
  minim = new Minim(this);
  String absolutePath = sketchPath();
  //println(absolutePath);
  String lessonDependanciesFolder = "/../../../../Lesson Dependancies Folder/Music All/";
  //
  String musicDirectory = absolutePath + lessonDependanciesFolder;
  //println(musicDirectory);
  File directory = new File(musicDirectory); //Uses Java Library to create class (variables & code)
  //A class is like an .mp3 that has music and text information
  File[] fileNames = directory.listFiles(); //Uses built in class to list all files
  String[] files = new String[fileNames.length]; //convert File to String for minim.loadFile()
  int i=0;
  if ( fileNames != null ) {
    for ( File file : fileNames ) { //FOR EACH Loop, creates locate class
      files[i] = lessonDependanciesFolder + file.getName(); //print fileNames.getName() Object to String
      //Note: getName() is built in code
      i++; //iteration necessary here, not in regular FOR
    }
  }
  //printArray(files);
  currentSong=0;
  playList = new AudioPlayer[fileNames.length]; //sets the array length
  while ( currentSong < fileNames.length ) {
    playList[ currentSong ] = minim.loadFile( files[ currentSong ] );
    currentSong++; //functions similar to FOR
  }
  numberOfSongs = fileNames.length;
  println("Loading currentSong Variable");
  currentSong = loadCurrentSong();
  println("Current Song is", currentSong+1, "of", numberOfSongs);
  playList[ currentSong ].play();
  //
} //End setup
//
void draw() {
  drawButtons();
} //End draw
//
void mousePressed() {
  mousePressedQuitButton();
} //End mousePressed
//
void keyPressed() {
  //Simple NEXT Button
  playList[ currentSong ].pause();
  playList[ currentSong ].rewind();
  if ( currentSong >= numberOfSongs-1 ) {
    currentSong=0;
  } else {
    currentSong++;
  }
  playList[ currentSong ].play();
} //End keyPressed
//
// Load the currentSong-value from a .txt file
// String array illustrates more than one varaible can be saved as
// Start-up preference
int loadCurrentSong() {
  String[] number = loadStrings(saveTxtPath_currentSong); //written as a string
  if (number != null && number.length > 0) {
    println("Loaded current song: " + number[0]);
    return int(number[0]);
  }
  return 0; // Default to the first song if no file exists
}
//
// End Main Program

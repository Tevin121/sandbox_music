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
  minim = new Minim(this);
  String absolutePath = sketchPath();
  println(absolutePath);
  String lessonDependanciesFolder = "/../../../../Lesson Dependancies Folder/Music All/";
  String musicDirectory = absolutePath + lessonDependanciesFolder;
  //println(musicDirectory);
  File directory = new File(musicDirectory); //Uses Java Library to create class (variables & code)
  //A class is like an .mp3 that has music and text information
  File[] fileNames = directory.listFiles(); //Uses built in class to list all files
  String[] files = new String[fileNames.length]; //convert File to String for minim.loadFile()
  numberOfSongs = fileNames.length;
  currentSong = numberOfSongs-numberOfSongs;
  //int i=0;
  if ( fileNames != null ) {
    //
    for ( int i=currentSong; i<numberOfSongs; i++) {
      files[i] = lessonDependanciesFolder + fileNames[i].getName(); //print fileNames.getName() Object to String
    } // End old FOR
    /*
    for ( File file : fileNames ) { //FOR-EACH Loop, creates locate class
     files[i] = lessonDependanciesFolder + file.getName(); //print fileNames.getName() Object to String
     //Note: getName() is built in code
     i++; //iteration necessary here, not in regular FOR
     }
     */
  }
  //printArray(files);
  //
  playList = new AudioPlayer[fileNames.length]; //sets the array length
  while ( currentSong < fileNames.length ) {
    playList[ currentSong ] = minim.loadFile( files[ currentSong ] );
    currentSong++; //functions similar to FOR
  }
  currentSong=0;
  playList[ currentSong ].play();
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

/* Read-Write to a File: see MAIN & Buttons only
 - 2x .txt
 - loading()
 - saving()
 - pause to verify in consol what is being read-write, verification only
 */
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
String saveTxtPath_randomStart; //For Saving Preference: Random Start
//
Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
//int numberOfSoundEffects = ???
AudioPlayer[] playList; //length of array determined by reading the Music Folder
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong; //Reads .txt file to populate last known song
//
Boolean randomStart=false;
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
  saveTxtPath_randomStart = sketchPath("randomStart.txt");
  println(saveTxtPath_currentSong);
  println(saveTxtPath_randomStart);
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
  randomStart = loadRandomStart();
  if ( randomStart==true ) {
    currentSong = int( random( numberOfSongs ) );
  } else {
    currentSong = loadCurrentSong();
  }
  println("Current Song is", currentSong+1, "of", numberOfSongs);
  playList[ currentSong ].play();
  //
} //End setup
//
void draw() {
  drawButtons();
  if ( playList[currentSong].isPlaying()==false ) println(currentSong);
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
  //
  if (key=='W' || key=='w') {
    if ( randomStart==true ) {
      randomStart=false;
    } else {
      randomStart=true;
    }
  }
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
Boolean loadRandomStart() {
  String[] dataString = loadStrings(saveTxtPath_randomStart);
  Boolean dataBoolean;
  if (dataString != null && dataString.length > 0) {
    println("Loaded random start: " + dataString[0]);
    try {
      dataBoolean = Boolean.parseBoolean(dataString[0]);
    }
    catch (Exception e) {
      println("Error parsing boolean value: " + e);
      dataBoolean = false; // default value
    }
  } else {
    println("File is empty.");
    dataBoolean = false; // default value
    return dataBoolean;
  }
  return dataBoolean;
}//End Random Start Boolean
//
// End Main Program

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
Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
//int numberOfSoundEffects = ???
AudioPlayer[] playList; //length of array determined by reading the Music Folder
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong = numberOfSongs - numberOfSongs; //ZERO
//
PImage[] imagesPlayList;
//
void setup() {
  //
  //fullScreen();
  size(700, 500);
  int appWidth = width; //displayWidth
  int appHeight = height; //displayHeight
  int shorterSide = int(comparisonReturnSmaller( float(appWidth), float(appHeight) ) );
  //
  minim = new Minim(this);
  //
  fileLoading();
  //
  image( imagesPlayList[0], 0, 0 );
  playList[0].play();
  //
  //printArray(imagesPlayList); //Gives Hardrive Addresses (refered to as registry)
  //printArray(playList); //Gives Hardrive Addresses (refered to as registry)
} //End setup
//
void draw() {
  //Empty Draw
} //End draw
//
void mousePressed() {
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
  println(currentSong, numberOfSongs);
} //End keyPressed
//
// End Main Program

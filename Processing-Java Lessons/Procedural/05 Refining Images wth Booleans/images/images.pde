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
  display();
  saveTxtSetup();
  minim = new Minim(this);
  fileLoading();
  //
  divs();
  //
  image( imagesPlayList[0], 0, 0 );
  playList[0].play();
  //
  //printArray(imagesPlayList); //Gives Hardrive Addresses (refered to as registry)
  //printArray(playList); //Gives Hardrive Addresses (refered to as registry)
} //End setup
//
void draw() {
  drawButtons();
  divRect(); //See DIVs
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
  //println(currentSong, numberOfSongs);
} //End keyPressed
//
// End Main Program

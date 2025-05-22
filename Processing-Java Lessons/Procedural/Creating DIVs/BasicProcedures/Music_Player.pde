Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
//int numberOfSoundEffects = ???
AudioPlayer[] playList = new AudioPlayer[ numberOfSongs ];
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong = numberOfSongs - numberOfSongs; //ZERO
//
void musicPlayerSetup() {
  //Music Loading - STRUCTURED Review
  minim = new Minim(this);
  String lessonDependanciesFolder = "Lesson Dependancies Folder/";
  String musicPong = "Music Pong/";
  String pongWorld = "Pong World";
  String fileExtension_mp3 = ".mp3";
  //
  String musicDirectory = "../../../../" + lessonDependanciesFolder + musicPong;
  String file = musicDirectory + pongWorld + fileExtension_mp3; //relative pathway or directory
  playList[ currentSong ] = minim.loadFile( file ); //ERROR: Verify Spelling & Library installed, Sketch / Import Library
  //Music Testing
  playList[currentSong].play();
  //
} //End Music Player Setup
//

Minim minim; //initates entire class
int numberOfSongs = 1; //Best Practice
//int numberOfSoundEffects = ???
AudioPlayer[] playList; //length of array determined by reading the Music Folder
//AudioPlayer[] soundEffects = new AudioPlayer[ numberOfSoundEffects ];
int currentSong = numberOfSongs - numberOfSongs; //ZERO
//
void musicPlayerSetup() {
  minim = new Minim(this);
  updateMusicFolder_DragDrop();
} // End Music Player Setup
//
//Call this whenever updating the files in the Folder with Drag and Drop
//Use println() & printArray() to inspect typing
void updateMusicFolder_DragDrop() {
  String absolutePath = sketchPath();
  String lessonDependanciesFolder = "/../../../../Lesson Dependancies Folder/Music All/";
  //
  String musicDirectory = absolutePath + lessonDependanciesFolder;
  File directory = new File(musicDirectory); //Uses Java Library
  File[] fileNames = directory.listFiles(); //Uses built in class to list all files
  String[] files = new String[fileNames.length]; //convert File to String for minim.loadFile()
  int i=0;
  if ( fileNames != null ) {
    for ( File file : fileNames ) {
      files[i] = lessonDependanciesFolder + file.getName(); //print fileNames.getName() Object to String
      i++;
    }
  }
  printArray(files);
  currentSong=0;
  playList = new AudioPlayer[fileNames.length];
  while ( currentSong < fileNames.length ) {
    playList[ currentSong ] = minim.loadFile( files[ currentSong ] );
    currentSong++;
  }
  currentSong=0;
  playList[ currentSong ].play();
} //End Updating Music Folder

/*File Loading for
 - Music Files
 - Image Files
 - Different Folders
 - Mixing Global Variables & Local Variables
 */
//
void fileLoading() {
  String lessonDependanciesFolder = "/../../../../Lesson Dependancies Folder/"; //Relative Pathway
  String imagesPath = sketchPath()+lessonDependanciesFolder+"Images/"; //Hardcoded
  String musicPath = sketchPath()+lessonDependanciesFolder+"Music All/"; //Hardcoded
  //
  //Music and Images match indices 1:1
  //currentSong variable controls Music and Image to CANVAS
  fileReading(musicPath, imagesPath, true); //Sets Music Variables, used for images
  fileReading(musicPath, imagesPath, false); //When false, loadMusic will load images
  //
  randomStart = loadRandomStart();
  if ( randomStart==true ) {
    currentSong = int( random( numberOfSongs ) );
  } else {
    currentSong = loadCurrentSong();
  }
  //println("File Loading", currentSong);
} //End File Loading
//
//NOTE Boolean loadMusic can be array when >2 to skip code
void fileReading(String pathwayMusic, String pathwayImages, Boolean loadMusic) {
  File directory = ( loadMusic==true ) ? new File(pathwayMusic) : new File(pathwayImages); //Uses Java Library to create class (variables & code)
  //File[] fileNames local & used for both music and images
  File[] fileNames = directory.listFiles(); //Uses built in class to list all files
  //String[] files local and used for both music and images
  String[] files = new String[fileNames.length];
  int i=0;
  if ( fileNames != null ) {
    for ( File file : fileNames ) { //FOR EACH Loop, creates local class
      if ( loadMusic==true ) files[i] = pathwayMusic + file.getName(); //print fileNames.getName() Object to String
      if ( loadMusic==false ) files[i] = pathwayImages + file.getName(); //print fileNames.getName() Object to String
      //Note: getName() is built in code
      i++; //iteration necessary here, not in regular FOR
    }
  }
  //For Music Only, used for images but not manipulated by images
  if ( loadMusic==true ) numberOfSongs = fileNames.length; //Global Used for both music and images
  if ( loadMusic==true ) currentSong = numberOfSongs-numberOfSongs; //Global Used for both music and images
  int numberOfFiles = fileNames.length;
  int fileNumber = numberOfFiles-numberOfFiles;
  //
  if ( loadMusic==true ) musicLoading(files);
  if ( loadMusic==false ) imageLoading(files, numberOfFiles, fileNumber);
} //End Music Loading
//
void musicLoading(String[] files) {
  playList = new AudioPlayer[numberOfSongs]; //sets the array length
  while ( currentSong < numberOfSongs ) {
    playList[ currentSong ] = minim.loadFile( files[ currentSong ] );
    currentSong++; //functions similar to FOR
  }
  currentSong=0; //Reset to beginning of playlist for MAIN
  //
} //End Music Loading
//
void imageLoading(String[] files, int numberOfFiles, int fileNumber) {
  imagesPlayList = new PImage[numberOfFiles]; //sets the array length
  while ( fileNumber < numberOfFiles ) {
    imagesPlayList[ fileNumber ] = loadImage( files[ fileNumber ] );
    fileNumber++; //functions similar to FOR
  }
} //End Image Loading
//

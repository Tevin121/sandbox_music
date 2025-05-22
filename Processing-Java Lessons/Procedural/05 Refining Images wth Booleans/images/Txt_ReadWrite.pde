String saveTxtPath_currentSong; //For Saving Last Known Song Played
String saveTxtPath_randomStart; //For Saving Preference: Random Start
//
void saveTxtSetup() {
  //Saving Last Known Song Played
  // Initialize the save file path
  saveTxtPath_currentSong = sketchPath("currentSong.txt");
  saveTxtPath_randomStart = sketchPath("randomStart.txt");
  println(saveTxtPath_currentSong);
  println(saveTxtPath_randomStart);
  //
} //End save Text Setup
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
    println("File is empty. See Txt ReadWrite");
    dataBoolean = false; // default value
    return dataBoolean;
  }
  return dataBoolean;
}//End Random Start Boolean
//
void saveCurrentSong() {
  println(currentSong);
  String[] number = { str(currentSong) }; //element ZERO
  printArray(number);
  saveStrings(saveTxtPath_currentSong, number);
  println("Saved current song: " + currentSong);
  println(randomStart);
  String[] dataBoolean = { str(randomStart) };
  saveStrings(saveTxtPath_randomStart, dataBoolean);
  println("Saved Random Start: " + randomStart);
}// End Save currentSong
//

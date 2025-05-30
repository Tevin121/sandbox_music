import java.io.*; // Import Java library for file handling
import ddf.minim.*; // Import Minim library for audio playback

// Global Variables
Minim minim; // Object to manage audio playback
AudioPlayer[] playList; // Array to store songs
AudioMetaData[] playListMetaData; // Array to store song metadata (like title)
AudioPlayer[] soundEffects; // Array to store sound effects
int currentSong = 0; // Index of the currently playing song
PFont generalFont; // Font for displaying text
color purple = #2C08FF; // Purple color for text and UI elements

void setup() {
  size(800, 600); // Set the window size
  minim = new Minim(this); // Initialize the Minim library

  // Load music files from the "MusicDownload" folder
  playList = loadAudioFiles("FreeWare Music/MusicDownload/");
  playListMetaData = new AudioMetaData[playList.length];
  for (int i = 0; i < playList.length; i++) {
    playListMetaData[i] = playList[i].getMetaData(); // Get metadata for each song
  }

  // Load sound effects from the "SoundEffect" folder
  soundEffects = loadAudioFiles("FreeWare Music/SoundEffect/");

  // Set up the font for displaying text
  generalFont = createFont("Harrington", 55);

  // Start playing a random song if there are songs in the playlist
  if (playList.length > 0) {
    currentSong = int(random(playList.length)); // Pick a random song to start
    playList[currentSong].play(); // Play the selected song
  }
}

void draw() {
  background(0, 255, 0); // Set the background color to green
  fill(purple); // Set the text color to purple
  textFont(generalFont, 20);
  textAlign(CENTER, CENTER); // Center the text horizontally and vertically

  // Display the title of the currently playing song
  if (playList.length > 0) {
    text("Now Playing: " + playListMetaData[currentSong].title(), width / 2, height / 4);
  } else {
    text("No songs available", width / 2, height / 4); // If no songs are loaded
  }

  // Automatically play the next song when the current one finishes
  if (playList.length > 0 && !playList[currentSong].isPlaying()) {
    playNextSong();
  }

  // Draw the help box
  drawHelpBox();
}

void keyPressed() {
  // Play or pause the current song
  if (key == 'P' || key == 'p') {
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause(); // Pause the song
    } else {
      playList[currentSong].play(); // Resume the song
    }
  }

  // Play the next song in the playlist
  if (key == 'N' || key == 'n') {
    playNextSong();
  }

  // Play the previous song in the playlist
  if (key == 'B' || key == 'b') {
    playPreviousSong();
  }

  // Play the first sound effect
  if (key == 'S' || key == 's') {
    if (soundEffects.length > 0) {
      soundEffects[0].rewind(); // Restart the sound effect
      soundEffects[0].play(); // Play the sound effect
    }
  }
}

// Function to load audio files from a folder
AudioPlayer[] loadAudioFiles(String folderPath) {
  File folder = new File(sketchPath(folderPath)); // Get the folder path
  if (!folder.exists() || !folder.isDirectory()) {
    println("Folder not found: " + folderPath); // Print an error if the folder doesn't exist
    return new AudioPlayer[0]; // Return an empty array
  }

  File[] files = folder.listFiles(); // Get all files in the folder
  AudioPlayer[] audioFiles = new AudioPlayer[files.length]; // Create an array for the audio files
  for (int i = 0; i < files.length; i++) {
    audioFiles[i] = minim.loadFile(files[i].getAbsolutePath()); // Load each file into the array
  }
  return audioFiles; // Return the array of audio files
}

// Function to play the next song in the playlist
void playNextSong() {
  if (playList.length > 0) {
    playList[currentSong].pause(); // Pause the current song
    currentSong = (currentSong + 1) % playList.length; // Move to the next song
    playList[currentSong].rewind(); // Restart the next song
    playList[currentSong].play(); // Play the next song
  }
}

// Function to play the previous song in the playlist
void playPreviousSong() {
  if (playList.length > 0) {
    playList[currentSong].pause(); // Pause the current song
    currentSong = (currentSong - 1 + playList.length) % playList.length; // Move to the previous song
    playList[currentSong].rewind(); // Restart the previous song
    playList[currentSong].play(); // Play the previous song
  }
}

// Function to draw the help box
void drawHelpBox() {
  fill(255); // White background for the help box
  rect(width / 4, height / 2, width / 2, height / 3, 10); // Draw the box with rounded corners

  fill(0); // Black text color
  textAlign(LEFT, TOP); // Align text to the top-left corner
  textSize(16);
  float x = width / 4 + 20; // Padding inside the box
  float y = height / 2 + 20;

  // Display the controls and their actions
  text("Controls:", x, y);
  text("P - Play/Pause the current song", x, y + 20);
  text("N - Play the next song", x, y + 40);
  text("B - Play the previous song", x, y + 60);
  text("S - Play a sound effect", x, y + 80);
}

float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
float quitX, quitY, quitWidth, quitHeight;
//
float menuX, menuY, menuWidth, menuHeight;
float menuButtonX, menuButtonY, menuButtonWidth, menuButtonHeight;
//
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
float messageDIV_X, messageDIV_Y, messageDIV_Width, messageDIV_Height;
float stopDivX, stopDivY, stopDivWidth, stopDivHeight;
float muteDivX, muteDivY, muteDivWidth, muteDivHeight;
float previousDivX, previousDivY, previousDivWidth, previousDivHeight;
float fastRewindDivX, fastRewindDivY, fastRewindDivWidth, fastRewindDivHeight;
float pauseDivX, pauseDivY, pauseDivWidth, pauseDivHeight;
float playDivX, playDivY, playDivWidth, playDivHeight;
float loopOnceDivX, loopOnceDivY, loopOnceDivWidth, loopOnceDivHeight;
float loopInfiniteDivX, loopInfiniteDivY, loopInfiniteDivWidth, loopInfiniteDivHeight;
float fastForwardDivX, fastForwardDivY, fastForwardDivWidth, fastForwardDivHeight;
float nextDivX, nextDivY, nextDivWidth, nextDivHeight;
float shuffleDivX, shuffleDivY, shuffleDivWidth, shuffleDivHeight;
float songPositionDivX, songPositionDivY, songPositionDivWidth, songPositionDivHeight;
float timeRemainingDivX, timeRemainingDivY, timeRemainingDivWidth, timeRemainingDivHeight;
float songTitleDivX, songTitleDivY, songTitleDivWidth, songTitleDivHeight;
float timeBarDivX, timeBarDivY, timeBarDivWidth, timeBarDivHeight;
float totalTimeDivX, totalTimeDivY, totalTimeDivWidth, totalTimeDivHeight;
//
//Button Shape Variables
float stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight;
float playX1, playY1, playX2, playY2, playX3, playY3;
float fastForwardX1, fastForwardY1, fastForwardX2, fastForwardY2, fastForwardX3, fastForwardY3;
float fastForwardX4, fastForwardY4, fastForwardX5, fastForwardY5, fastForwardX6, fastForwardY6;
float pauseX1, pauseY1, pauseWidth1, pauseHeight1;
float pauseX2, pauseY2, pauseWidth2, pauseHeight2;
//
void divs() {
  populationSetup();
  //
  divRect();
} //End DIVs
//
void populationSetup() {
  //Population
  menuX = appWidth*1/4;
  menuY = appHeight*1/4;
  menuWidth = appWidth*1/2;
  menuHeight = appHeight*1/2;
  menuButtonX = ;
  menuButtonY = ;
  menuButtonWidth = ;
  menuButtonHeight = ;
  //
  //rect(DIV) is a square to start, by design
  int numberOfButtons = 13; //Half a button on either side as space, Center Button is Play
  int widthOfButton = appWidth/numberOfButtons;
  int beginningButtonSpace = widthOfButton;
  int buttonY = appHeight*3/5;
  //
  quitButtonY = shorterSide*0;
  quitButtonHeight = quitButtonWidth = shorterSide*1/20;
  quitButtonX = appWidth - (shorterSide*1/20);
  //
  songTitleDivX = beginningButtonSpace;
  songTitleDivY = appHeight*1.5/20;
  songTitleDivWidth = appWidth*1/2 - beginningButtonSpace*1.5;
  songTitleDivHeight = appHeight*1/10;
  imageDivX = beginningButtonSpace;
  imageDivY = appHeight*4.5/20;
  imageDivWidth = appWidth*1/2 - beginningButtonSpace*1.5;
  imageDivHeight = appHeight*1.5/5; //1+1.5=2.5, half of the total height
  messageDIV_X = appWidth*1/2 + beginningButtonSpace*1/2;
  messageDIV_Y = appHeight*1.5/20;
  messageDIV_Width = appWidth*1/2 - beginningButtonSpace*1.5;
  messageDIV_Height = appHeight*9/20;
  //
  stopDivX = beginningButtonSpace + widthOfButton*0;
  stopDivY = buttonY;
  stopDivWidth = widthOfButton;
  stopDivHeight = widthOfButton;
  //
  //Play-Pause-Stop
  
  
  
  
  
  
  stopButtonX = stopDivX + stopDivWidth*1/4;
  stopButtonY = stopDivY + stopDivHeight*1/4;
  stopButtonWidth = widthOfButton*1/2;
  stopButtonHeight = widthOfButton*1/2;
  //
  muteDivX = beginningButtonSpace + widthOfButton*1;
  muteDivY = buttonY;
  muteDivWidth = widthOfButton;
  muteDivHeight = widthOfButton;
  previousDivX = beginningButtonSpace + widthOfButton*2;
  previousDivY = buttonY;
  previousDivWidth = widthOfButton;
  previousDivHeight = widthOfButton;
  fastRewindDivX = beginningButtonSpace + widthOfButton*3;
  fastRewindDivY = buttonY;
  fastRewindDivWidth = widthOfButton;
  fastRewindDivHeight = widthOfButton;
  pauseDivX = beginningButtonSpace + widthOfButton*4;
  pauseDivY = buttonY;
  pauseDivWidth = widthOfButton;
  pauseDivHeight = widthOfButton;
  //
  //Pause Button
  pauseX1 = pauseDivX + pauseDivWidth*1/4;
  pauseY1 = pauseDivY + pauseDivHeight*1/4;
  pauseWidth1 = pauseDivWidth*1/8;
  pauseHeight1 = pauseDivHeight*1/2;
  pauseX2 = pauseDivX + pauseDivWidth*5/8;
  pauseY2 = pauseDivY + pauseDivHeight*1/4;
  pauseWidth2 = pauseDivWidth*1/8;
  pauseHeight2 = pauseDivHeight*1/2;
  //
  playDivX = beginningButtonSpace + widthOfButton*5; //TEACHER Only" manipulate this number to draw simulate all buttons
  playDivY = buttonY;
  playDivWidth = widthOfButton;
  playDivHeight = widthOfButton;
  //
  //Play Button
  playX1 = playDivX + playDivWidth*1/4;
  playY1 = playDivY + playDivHeight*1/4;
  playX2 = playDivX + playDivWidth*3/4;
  playY2 = playDivY + playDivHeight*1/2;
  playX3 = playDivX + playDivWidth*1/4;
  playY3 = playDivY + playDivHeight*3/4;
  //
  loopOnceDivX = beginningButtonSpace + widthOfButton*6;
  loopOnceDivY = buttonY;
  loopOnceDivWidth = widthOfButton;
  loopOnceDivHeight = widthOfButton;
  loopInfiniteDivX = beginningButtonSpace + widthOfButton*7;
  loopInfiniteDivY = buttonY;
  loopInfiniteDivWidth = widthOfButton;
  loopInfiniteDivHeight = widthOfButton;
  fastForwardDivX = beginningButtonSpace + widthOfButton*8;
  fastForwardDivY = buttonY;
  fastForwardDivWidth = widthOfButton;
  fastForwardDivHeight = widthOfButton;
  //
  //Fast Forward Button
  fastForwardX1 = fastForwardDivX + fastForwardDivWidth*1/4;
  fastForwardY1 = fastForwardDivY + fastForwardDivHeight*1/4;
  fastForwardX2 = fastForwardDivX + fastForwardDivWidth*1/2;
  fastForwardY2 = fastForwardDivY + fastForwardDivHeight*1/2;
  fastForwardX3 = fastForwardDivX + fastForwardDivWidth*1/4;
  fastForwardY3 = fastForwardDivY + fastForwardDivHeight*3/4;
  fastForwardX4 = fastForwardDivX + fastForwardDivWidth*1/2;
  fastForwardY4 = fastForwardDivY + fastForwardDivHeight*1/4;
  fastForwardX5 = fastForwardDivX + fastForwardDivWidth*3/4;
  fastForwardY5 = fastForwardDivY + fastForwardDivHeight*1/2;
  fastForwardX6 = fastForwardDivX + fastForwardDivWidth*1/2;
  fastForwardY6 = fastForwardDivY + fastForwardDivHeight*3/4;
  //
  nextDivX = beginningButtonSpace + widthOfButton*9;
  nextDivY = buttonY;
  nextDivWidth = widthOfButton;
  nextDivHeight = widthOfButton;
  shuffleDivX = beginningButtonSpace + widthOfButton*10;
  shuffleDivY = buttonY;
  shuffleDivWidth = widthOfButton;
  shuffleDivHeight = widthOfButton;
  //
  float musicSongPaddingY = widthOfButton*1/4;
  float musicSongSpaceX = stopDivX;
  float musicSongSpaceY = stopDivY + widthOfButton + musicSongPaddingY;
  float musicSongSpaceWidth = appWidth - widthOfButton*2;
  float musicSongSpaceHeight = appHeight - musicSongPaddingY - musicSongSpaceY;
  //rect(musicSongSpaceX, musicSongSpaceY, musicSongSpaceWidth, musicSongSpaceHeight); //testing only
  songPositionDivX = musicSongSpaceX;
  songPositionDivY = musicSongSpaceY;
  songPositionDivWidth = musicSongSpaceWidth*1/5;
  songPositionDivHeight = musicSongSpaceHeight*2/5;
  timeRemainingDivX = musicSongSpaceX + musicSongSpaceWidth*3/5;
  timeRemainingDivY = musicSongSpaceY + musicSongSpaceHeight*3/5;
  timeRemainingDivWidth = musicSongSpaceWidth*1/5;
  timeRemainingDivHeight = musicSongSpaceHeight*2/5;
  totalTimeDivX = musicSongSpaceX + musicSongSpaceWidth*4/5;
  totalTimeDivY = musicSongSpaceY + musicSongSpaceHeight*3/5;
  totalTimeDivWidth = musicSongSpaceWidth*1/5;
  totalTimeDivHeight = musicSongSpaceHeight*2/5;
  float musicSongSpaceButtonHeight = musicSongSpaceHeight*1/5;
  timeBarDivX = musicSongSpaceX;
  timeBarDivY = musicSongSpaceY + musicSongSpaceHeight*2/5;
  timeBarDivWidth = musicSongSpaceWidth;
  timeBarDivHeight = musicSongSpaceHeight*1/5;
  //
} //End Population Setup
//
void divRect() {
  //
  //Entire APP
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  //
  rect(menuX, menuY, menuWidth, menuHeight);
  rect(menuButtonX, menuButtonY, menuButtonWidth, menuButtonHeight);
  //
  
  
  
  
  
  
  
  rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
  //rect(messageDIV_X, messageDIV_Y, messageDIV_Width, messageDIV_Height);
  //rect(stopDivX, stopDivY, stopDivWidth, stopDivHeight);  //*0
  //rect(muteDivX, muteDivY, muteDivWidth, muteDivHeight); //*1
  //rect(previousDivX, previousDivY, previousDivWidth, previousDivHeight); //*2
  //rect(fastRewindDivX, fastRewindDivY, fastRewindDivWidth, fastRewindDivHeight); //*3
  //rect(pauseDivX, pauseDivY, pauseDivWidth, pauseDivHeight); //*4
  rect(playDivX, playDivY, playDivWidth, playDivHeight); //*5
  rect(loopOnceDivX, loopOnceDivY, loopOnceDivWidth, loopOnceDivHeight);
  rect(loopInfiniteDivX, loopInfiniteDivY, loopInfiniteDivWidth, loopInfiniteDivHeight);
  //rect(fastForwardDivX, fastForwardDivY, fastForwardDivWidth, fastForwardDivHeight);
  //rect(nextDivX, nextDivY, nextDivWidth, nextDivHeight);
  //rect(shuffleDivX, shuffleDivY, shuffleDivWidth, shuffleDivHeight);
  rect(songPositionDivX, songPositionDivY, songPositionDivWidth, songPositionDivHeight);
  rect(songTitleDivX, songTitleDivY, songTitleDivWidth, songTitleDivHeight);
  rect(timeBarDivX, timeBarDivY, timeBarDivWidth, timeBarDivHeight);
  rect(timeRemainingDivX, timeRemainingDivY, timeRemainingDivWidth, timeRemainingDivHeight);
  rect(totalTimeDivX, totalTimeDivY, totalTimeDivWidth, totalTimeDivHeight);
  //
  //rect(timeBarDivX, timeBarDivY, timeBarDivWidth, timeBarDivHeight);
  rect(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight);
  triangle(playX1, playY1, playX2, playY2, playX3, playY3);
  triangle(fastForwardX1, fastForwardY1, fastForwardX2, fastForwardY2, fastForwardX3, fastForwardY3);
  triangle(fastForwardX4, fastForwardY4, fastForwardX5, fastForwardY5, fastForwardX6, fastForwardY6);
  rect(pauseX1, pauseY1, pauseWidth1, pauseHeight1);
  rect(pauseX2, pauseY2, pauseWidth2, pauseHeight2);
  //
} //End DIV Rectangles
//
//End Subprogram DIVs
//

void gameover() {
  background(lightpink);
  if (win == false) {
    falsescreen();
    lose.play();
  }
  if (win == true) {
    winscreen();
    winscreen.play();
  }
}

void gameoverclick() {
  mode = load;
  reset();
}

void reset() {
  win = false;
  cx = 350;
  cy = 650;
  vx = 0;
  vy = 3;
  lives = 3;
  score = 0;
  int i = 0;
  while (i<n) {
    alive[i] = true;
    i = i+1;
  }
  paddlex = width/2;
  intromsc.rewind();
  lose.rewind();
  winscreen.rewind();
  lose.pause();
  winscreen.pause();
  go.rewind();
  count.rewind();
}

void falsescreen() {
  textSize(100);
  textFont(loopy);
  fill(violet);
  text("You lost!", 348, 252);
  text("Better luck next timE", 348, 352);

  fill(pink);
  text("You lost!", 350, 250);
  text("Better luck next timE", 350, 350);


  fill(lightpink);
  text("Click to Restart", 348, 542);

  fill(pink);
  text("Click to Restart", 350, 540);
}

void winscreen() {
  textSize(100);
  textFont(loopy);
  fill(violet);
  text("You woN!", 338, 252);
  text("Congratulations!", 338, 352);

  fill(pink);
  text("You woN!", 340, 250);
  text("Congratulations!", 340, 350);

  fill(lightpink);
  text("Click to Restart", 358, 542);

  fill(pink);
  text("Click to Restart", 360, 540);
}

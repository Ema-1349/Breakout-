void pause() {
  textSize(180);
  textFont(paused);
  fill(0);
  text("Paused", width/2, height/2);

  textFont(blocky);
  text("Click to resume", 350, 500);
}

void pauseclick() {
  mode = game;
}

void mouseReleased() {
  if (mode == intro) {
    introclick();
  } else if (mode == game) {
    gameclick();
  } else if (mode == gameover) {
    gameoverclick();
  } else if (mode == pause) {
    pauseclick();
  }
}



void keyPressed() {
  if (keyCode == LEFT) {
    leftkey = true;
  }
  if (keyCode == RIGHT) {
    rightkey = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftkey = false;
  }
  if (keyCode == RIGHT) {
    rightkey = false;
  }
}

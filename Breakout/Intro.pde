void intro() {
  intromsc.play();

  countdown   = 0;

  background(violet);

  //   gif   //
  image(startgif[sf], 0, 0, width, height);
  if (frameCount % 3 == 0) {
    sf++;
  }
  if (sf == 14) {
    sf = 0;
  }

  title();

  startbtn();

  transitionin();
}

void introclick() {
  if (mouseonstartr == true) {
    mode = game;
    intromsc.pause();
    docountdown = true;
  }
  if (mouseonstartl == true) {
    mode = game;
    intromsc.pause();
    docountdown = true;
  }
}


void transitionin() {
  if (ttrigger == true) {
    tin = true;
  }
  if (tin == true) {
    tincount = tincount + 1;
    fill(255, 255, 255, opacityout);
    noStroke();
    rect(-10, -10, width + 10, height + 10);

    opacityout = opacityout - 1;
    if (opacityout < 0) {
      opacityout = 255;
      tin = false;
      ttrigger = false;
    }
  }
}

void title() {
  textFont(blocky);
  textSize(titlesize);
  fill(pink);
  text("Breakout !", width/2 - 3, height/4 + 100);

  fill(lightpink);
  text("Breakout !", width/2, height/4 + 97);

  if (titlesize > 100) {
    titlegrow = false;
  }
  if (titlesize < 65) {
    titlegrow = true;
  }
  if (titlegrow == true) {
    titlesize = titlesize + 0.8;
  } 
  if (titlegrow == false) {
    titlesize = titlesize - 0.8;
  }
}

void startbtn() {
  starttactile();
}

void starttactile() {
  if (mouseX > 200 && mouseX < 460 && mouseY > 480 && mouseY < 450) {
    mouseonstartl = true;
  } else mouseonstartl = false;
  if (mouseX > 240 && mouseX < 500 && mouseY > 520 && mouseY < 620) {
    mouseonstartr = true;
  } else mouseonstartr = false;
  if (mouseonstartl && mouseonstartr == true) {
    mouseonstart();
  }
  if (mouseonstartr == true) {
    mouseonstart();
  }
  if (mouseonstartl == true) {
    mouseonstart();
  }
  if (mouseonstartr == false && mouseonstartl == false) {
    mousenotonstart();
  }
}

void mouseonstart() {
  fill(lightpink);
  strokeWeight(5);
  stroke(255);
  rect(200, 480, 260, 100, 10);

  fill(pink);
  textSize(50);
  textFont(blocky2);
  text("P    L    A    Y", 327, 527);
  fill(255);
  text("P    L    A    Y", 330, 530);

  fill(lightviolet);
  stroke(255);
  strokeWeight(10);
  rect(240, 520, 260, 100, 10);

  fill(violet);
  textSize(50);
  text("P   L   A   Y", 367, 567);
  fill(255);
  text("P   L   A   Y", 370, 570);
}

void mousenotonstart() {
  fill(lightviolet);
  strokeWeight(5);
  stroke(255);
  rect(200, 480, 260, 100, 10);

  fill(violet);
  textSize(50);
  textFont(blocky2);
  text("P    L    A    Y", 327, 527);
  fill(255);
  text("P    L    A    Y", 330, 530);

  fill(lightpink);
  stroke(255);
  rect(240, 520, 260, 100, 10);

  fill(pink);
  textSize(50);
  text("P   L   A   Y", 367, 567);
  fill(255);
  text("P   L   A   Y", 370, 570);
}

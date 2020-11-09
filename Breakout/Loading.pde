void load() {
  loading.play();

  backdrop();       //Background

  loadtext();       //Text

  loaddots();       //Moving dots

  //   gif   //
  image(loadinggif[lf], 200, 500, 300, 200);
  if (frameCount % 6 == 0) {
    lf++;
  }
  if (lf == 3) {
    lf = 0;
  }

  transitionout();  //Transition to Intro
} 



///     Background      ///
void backdrop() {
  background(violet);
  fill(lightviolet);
  stroke(lightviolet);
  rect(20, 20, 660, 760, 5);
  fill(255);
  stroke(255);
  rect(40, 40, 620, 720, 5);

  image(loadmoon, 250, 140, 200, 220);
}



///     Loading     ///
void loadtext() {
  textFont(script);
  fill(lightviolet);
  textSize(40);
  text("l   o   a   d   i   n   g", width/3 + 40, height/2);
  fill(violet);
  text("l   o   a   d   i   n   g", width/3 + 40, height/2);
}



///     Dots      ///
void loaddots() {
  textSize(70);
  textFont(loopy);
  fill(violet);
  loadcount = loadcount + 1;
  if (loadcount < 30 && loadcount > 0) {                  // *..
    text(".", width/2 + 140, 2*height/3 - 140);
    text(". .", width/2 + 195, 2*height/3 - 130);
  }
  if (loadcount > 30 && loadcount < 60) {                 //.*.
    text(".", width/2 + 175, 2*height/3 - 140);
    text(".", width/2 + 140, 2*height/3 - 130);
    text(".", width/2 + 212, 2*height/3 - 130);
  }
  if (loadcount > 60 && loadcount < 90) {                //..*
    text(".", width/2 + 212, 2*height/3 - 140);
    text(". .", width/2 + 158, 2*height/3 - 130);
  }
  if (loadcount > 90) {
    loadcount = 0;
  }
}



///     Transition     ///
void transitionout() {
  toutcount = toutcount + 1;
  if (toutcount < loadtime) {
    tout = false;
  } else {
    tout = true;
  }

  if (tout == true) {
    fill(255, 255, 255, opacityin);
    noStroke();
    rect(-10, -10, width + 10, height + 10);

    opacityin = opacityin + 1;
    if (opacityin > 300) {
      mode = intro;
      loading.rewind();
      loading.pause();
      opacityin = 0;
      tout = false;
      ttrigger = true;
    }
  }
}

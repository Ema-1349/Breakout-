void game() {
  background(#fff4fc);

  paddle();

  score();

  ball();

  bricks();

  countdown();
}

void gameclick() {
  mode = pause;
}

void paddle() {
  fill(lightpink);
  strokeWeight(2);
  stroke(pink);
  circle(paddlex, paddley, 150);

  if (paddlex < 80) {              //Paddle restrictions
    paddlex = 80;
  }
  if (paddlex > 620) {
    paddlex = 620;
  }

  if (lives == 0) {                //Losing
    mode = gameover;
  }

  if (dist(paddlex, paddley, cx, cy) <= 75 + cd/2) {        //Hitting paddle
    vx = (cx-paddlex)/25; 
    vy = (cy-paddley)/25;
    vx = vx*1.7;
    vy = vy*1.7;
    beep.rewind();
    beep.play();
  }
}

void ball() {
  fill(lightpink);
  stroke(pink);
  circle(cx, cy, cd);

  if (leftkey == true) {                                    //Paddle movement
    paddlex = paddlex - 6.5;
  }
  if (rightkey == true) {
    paddlex = paddlex + 6.5;
  }

  if (countdown > 420) {
    cx = cx + vx;  
    cy = cy + vy;

    if (cx < cd/2) {                                         //Ball hitting on the sides and top
      vx = 3;
      vx = vx*1.7;
      boop.rewind();
      boop.play();
    }
    if (cx > 700-cd/2) {
      vx = -3;
      vx = vx*1.9;
      boop.rewind();
      boop.play();
    }
    if (cy < cd/2) {
      vy = vy*-1.05;
      vy = vy*1.5;
      boop.rewind();
      boop.play();
    }

    if (dist(cx, cy, paddlex, paddley) < cd/2 + 75) {       //Ball hitting paddle
      vx = (cx - paddlex)/2 + 5;
      vy = (cy - paddley)/2 + 5;
      beep.rewind();
      beep.play();
    }

    if (cy > height + cd/2) {                               //Loss of a life
      fail.play();
      fail.rewind();
      lives = lives - 1; 
      cx = width/2;
      cy = 550;
      vx = 0;
      vy = 3;
      if (lives == 0) {
        win = false;
        mode = gameover;
        fail.rewind();
        fail.play();
      }
    }
  }
}

void countdown() {
  if (docountdown == true) {

    countdown = countdown + 1;
    if (countdown > 0 && countdown < 100) {
      textFont(blockygame);
      fill(violet);
      text("THREE", 348, 348);
      text("THREE", 352, 352);
      fill(lightviolet);
      text("THREE", 350, 350);
    }
    if (countdown > 0 && countdown < 2){ count.play(); count.rewind(); }
    if (countdown > 100 && countdown < 200) {
      textFont(blockygame);
      fill(violet);
      text("TWO", 348, 348);
      text("TWO", 352, 352);
      fill(lightviolet);
      text("TWO", 350, 350);
    }
    if (countdown > 100 && countdown < 102){ count.play(); count.rewind(); }
    if (countdown > 200 && countdown < 300) {
      textFont(blockygame);
      fill(violet);
      text("ONE", 348, 348);
      text("ONE", 352, 352);
      fill(lightviolet);
      text("ONE", 350, 350);
    }
    if (countdown > 200 && countdown < 202){ count.play(); count.rewind(); }
    if (countdown > 300 && countdown < 400) {
      textFont(blockygame);
      fill(violet);
      text("G O", 348, 348);
      text("G O", 352, 352);
      fill(lightviolet);
      text("G O", 350, 350);

      go.play();
    }
  }
}


///     Bricks     ///
void bricks() {
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      drawbricks(i);
    }
    i++;
  }
}

void drawbricks(int i) {
  if (y[i] == 100) fill(green);                         //Bricks
  if (y[i] == 200) fill(lightpink);
  if (y[i] == 300) fill(blue);
  if (y[i] == 400) fill(purple);
  stroke(255);
  circle(x[i], y[i], brickd);

  if (dist(cx, cy, x[i], y[i]) < cd/2 + brickd/2) {     //Collisions
    vx = (cx - x[i])/7;
    vy = (cy - y[i])/7;
    alive[i] = false;
    score = score + 1;
    broke.rewind();
    broke.play();
    if (score == n) {                                   //Winning
      win = true;
      mode = gameover;
      winmsc.rewind();
      winmsc.play();
    }
  }
}


void score() {
  fill(violet);
  stroke(violet);
  textSize(10);
  textFont(loopy);
  text("Lives: " + lives, 120, 600);

  text("Score: " + score, 580, 600);
}

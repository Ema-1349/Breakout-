//Emma Dong
//Block 1-1B
//Breakout



///     Music     ///
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer beep;
AudioPlayer boop;
AudioPlayer broke;
AudioPlayer fail;
AudioPlayer winmsc;
AudioPlayer intromsc;
AudioPlayer count;
AudioPlayer go;
AudioPlayer lose;
AudioPlayer winscreen;
AudioPlayer loading;


///     Imported Files     ///
PFont script;
PFont blocky;
PFont loopy;
PFont blocky2;
PFont blockygame;
PFont happi;
PFont paused;
PImage loadmoon;



///     Interaction variables     ///
boolean leftkey = false;
boolean rightkey = false;


///      Brick Variables     ///
int [] x;
int [] y;
boolean [] alive;
int brickd;
int n;
int tempx, tempy;


///     Mode Variables     ///
int mode;
final int intro    = 1 ;
final int game     = 2 ;
final int pause    = 3 ;
final int gameover = 4 ;
final int load     = 5 ;


///     Color Variables      ///
color lightpink    = #ffe0f7;
color pink         = #FE91CA;
color lightviolet  = #d3dbff;
color violet       = #251f44;
color blue         = #d6efff;
color green        = #d8ffdf;
color purple       = #e1cfff;


///     Gameover Variables     ///
boolean win = true;


///     Intro Variables     ///
boolean tin = false;               //Transition
float tincount = 0;
float opacityout = 255;

boolean titlegrow = true;          //Title animation
float titlesize = 80;

boolean mouseonstartl = false;     //Mouse on start button
boolean mouseonstartr = false;


///     Loading Variables     ///
int loadcount = 0;

boolean tout = false;                //Are we transitioning?
float toutcount = 0;                 //Transition counter
float opacityin = 0;                 //Transition
boolean ttrigger = false;            //Trigger of transition on intro
float loadtime = random(200, 600);   //How long it takes to load


///     Game Variables     ///
float paddley = 800;            //Paddle
float paddlex = 350;
float cx = 350;                 //Ball
float cy = 650;
float cd = 20;
float vx = 0;                   //Ball movement
float vy = 3;

int lives = 3;                  //Lives and scoring
int score = 0;

int countdown = 0;              //Countdown before starting game

boolean docountdown = false;    //Are we doing the countdown?


///     Gifs     ///
PImage [] loadinggif;
int lframecount;    // loading framecount
int lf = 0;         // loading frames

PImage[] startgif;
int sframecount;    // start framecount
int sf = 0;         // start frames


void setup() {
  textAlign(CENTER, CENTER);

  size(700, 800);
  mode = intro;
  smooth();

  ///     Minim     ///
  minim = new Minim(this);
  beep = minim.loadFile("beep.wav");
  boop = minim.loadFile("boop.wav");
  broke = minim.loadFile("break.wav");
  fail = minim.loadFile("failure.wav");
  winmsc = minim.loadFile("win.wav");
  intromsc = minim.loadFile("intro.mp3");
  count = minim.loadFile("count.mp3");
  go = minim.loadFile("go.wav");
  lose = minim.loadFile("lose.mp3");
  winscreen = minim.loadFile("winscreen.mp3");
  loading = minim.loadFile("loading.mp3");


  ///     Bricks     ///
  n = 30;
  brickd = 50;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 70;
  tempy = 100;

  int i = 0;
  while (i < n) {                     //Draw bricks' locations
    x[i] = tempx;                      
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 70;
    if (tempx == width) {
      tempy = tempy + 100;
      tempx = 100;
    }
    if (y[i] == 200 && x[i] > 550) {
      tempy = tempy + 100;
      tempx = 130;
    }
    if (y[i] == 300 && x[i] > 520) {
      tempy = tempy + 100;
      tempx = 160;
    }
    i = i + 1;
  }

  ///     Imported Files      ///
  script = createFont("script.ttf", 30);
  loadmoon = loadImage("load.jpg");
  blocky = createFont("blocky.ttf", 30);
  loopy = createFont("loopy.ttf", 60);
  blocky2 = createFont("silver.otf", 50);
  blockygame = createFont("silver.otf", 300);
  happi = createFont("happy.ttf", 30);
  paused = createFont("paused.ttf", 180);


  ///     Loadscreen gif     ///
  lframecount = 3;
  loadinggif = new PImage[lframecount];

  int lgifi = 0;
  while (lgifi < lframecount) {
    loadinggif[lgifi] = loadImage("frame"+lgifi+".gif");

    lgifi++;
  }

  ///     Scartscreen gif     ///
  sframecount = 14;
  startgif = new PImage[sframecount];

  int sgifi = 0;
  while (sgifi < sframecount) {
    startgif[sgifi] = loadImage("startframe"+sgifi+".gif");

    sgifi++;
  }
}


void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == load) {
    load();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else if (mode == pause) {
    pause();
  } else {
    println("Error: Line " + mode);
  }
}

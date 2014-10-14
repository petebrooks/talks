import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
int t;
AudioPlayer players[];
String file_list = "talk_1_0_d.txt";
String[] files;
int time;

ArrayList <Sample> samples = new ArrayList <Sample>();


void setup() {
  size(500, 500);
  minim = new Minim(this);
  t = 0;
  time = millis();
  files = loadStrings(file_list);
  players = new AudioPlayer[files.length+1];
  createSamples(files);
  // printText();
  talk(0);
  // noLoop();
  // println(samples.size());
  // println(samples.get(1).get_length());
}

void draw() {
  if (millis() > wait_time(t)) {
    stop_talk(t);
    // noLoop();
    getNext();
  } else {
    println(samples.get(t).get_text());
    // println(getNext());
  }
}

void keyPressed() {
  getNext();
  loop();
}


void talk(int r) {
  /*
  if(!samples.get(r).playing()) {
   samples.get(r).start_play();
   time = millis();
  }
  */
  samples.get(r).start_play();
   time = millis();
  // frameRate(wa
}

int wait_time(int r) {
  return time + samples.get(r).get_mil();
}

void stop_talk(int r) {
  samples.get(r).stop_play();
}

void printText() {
  for (int i = 0; i < samples.size (); i++) {
    println("----------------------------");
    println("sample #" + i);
    println("ref: " + samples.get(i).get_ref());
    println("file: " + samples.get(i).get_file());
    println("text: " + samples.get(i).get_text());
    println("time: " + samples.get(i).get_mil());
    println("rand_size: " + samples.get(i).rand_size());
  }
}


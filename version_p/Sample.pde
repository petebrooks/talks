class Sample {
  String file;
  int ref;
  String text;
  int mil;
  AudioPlayer player;
  int[] next;
  int rand_size;

  Sample(int r, String f, String t, String n) {
    ref = r;
    text = t;
    file = "TASCAM_" + f + "S34D06.mp3";
    //mil = int(1000*s);
    println(ref, mil);
    next = int(split(n, ","));
    rand_size = next.length;
    players[ref] = minim.loadFile(file, 2048);
    mil = players[ref].length()+300;
  }

  void start_play() {
    // players[ref].rewind();
    // players[ref].cue(0);
    players[ref].play();
  }

  void stop_play() {
    players[ref].pause();
    players[ref].rewind();
    // players[ref].cue(0);
  }


  int get_mil() {
    return mil;
  }

  String get_file() {
    return file;
  }

  String get_text() {
    return text;
  }

  int get_ref() {
    return ref;
  }

  boolean playing() {
    return players[ref].isPlaying();
  }

  int rand_size() {
    return rand_size;
  }

  int get_next() {
    int i = floor(random(rand_size));
    int n = constrain(next[i]-1, 0, samples.size());
    return n;
  }
  
  int get_length() {
    return players[ref].length();
  }
}

void createSamples(String[] s) {
  int r = 0;
  for (String file : s) {
    String[] f = split(file, ":");
    String fn = f[0];
    println(fn);
    //float sec = float(f[1]);
    String t = f[1];
    String n = f[2];
    samples.add(new Sample(r, fn, t, n));
    r++;
  }
}

void getNext() {
  t = samples.get(t).get_next();
  talk(t);
}


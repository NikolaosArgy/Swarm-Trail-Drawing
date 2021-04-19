void displaygrid() {
  int step = 20;
  int cells= lineSize*2/step;
  pushStyle();
  strokeWeight(1);
  stroke(0, 90);
  for (int x= -cells; x<cells+1; x++) {
    for (int y= -cells; y<cells+1; y++) {
      line(x*step, y*step, -lineSize, x*step+step/5, y*step, -lineSize);
      line(x*step, y*step, -lineSize, x*step-step/5, y*step, -lineSize);
      line (x*step, y*step, -lineSize, x*step, y*step+ step/5, -lineSize);
      line (x*step, y*step, -lineSize, x*step, y*step-step/5, -lineSize);
    }
  }
  popStyle();
}

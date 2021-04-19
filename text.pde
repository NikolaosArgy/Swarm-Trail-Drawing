void text_()
{
  cam.beginHUD();
  fill(0);
  textSize(14);
  text("Move Attractor", 10, 10); 
  text("w = +z Vector", 10, 30); 
  text("s = -z Vector", 10, 50); 
  text("d = +x Vector", 10, 70); 
  text("a = -x Vector", 10, 90); 
  text("e = +y Vector", 10, 110); 
  text("q = -y Vector", 10, 130); 
  text("press P to print lines", 10, 150); 
  cam.endHUD();
}

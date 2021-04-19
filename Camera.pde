void camera_init()
{
  cam = new PeasyCam(this, 2000);
  cam.rotateX(-20);
  //cam.rotateY(20);
  cam.setMinimumDistance(150); 
}

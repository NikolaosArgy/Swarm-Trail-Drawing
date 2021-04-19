/*

 * Swarm Trail Drawing
 
 ******************************************
 * Copyright (c) 2017 Nikolaos Argyros
 ******************************************
 
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

*/

import peasy.*;
import processing.dxf.*;
PeasyCam cam;
Fly[] swarm; // DECLARE the array

int lineSize=200;
PVector[] attractors;
boolean record = false;
boolean Bounding_Box= false; //display Box

int moveX = 100;
int moveY = 100;
int moveZ = 100;
void setup()
{
  size(1000, 800, P3D);
  camera_init();

  swarm = new Fly[25]; //INITIALIZE the array

  for (int i=0; i<swarm.length; i++)  //CONSTRUCT EVERY object in the array
  {
    swarm[i] = new Fly(); //CONSTRUCT THE OBJECT
  }

  attractors = new PVector[1];
  for (int i=0; i<attractors.length; i++)
  {
    attractors[i] = new PVector(moveX, moveY, moveZ);
  }
}

void draw()
{
  if (record == true) {
    beginRaw(DXF, "output.dxf"); // Start recording to the file
  } 
  background(255);
  text_();
  for (int i=0; i<swarm.length; i++)  //ITERATE through the objects and CALL their methods
  {
    // swarm[i].move(swarm);
    swarm[i].moveAttractors(swarm, attractors);
    if (!record) swarm[i].display();
    swarm[i].addTrail();
    swarm[i].drawTrail();
  }
  if (record == true) {
    endRaw();
    record = false; // Stop recording to the file
  }
  displaygrid();
  stroke(0);
  strokeWeight(10);
  point(moveX, moveY, moveZ);

  if (keyPressed) {
    if (key == 'w')
    {
      moveZ += 100;
    }
    if (key == 's')
    {
      moveZ -= 100;
    }
    if (key == 'd')
    {
      moveX += 100;
    }
    if (key == 'a')
    {
      moveX -= 100;
    }
    if (key == 'q')
    {
      moveY -= 100;
    }
    if (key == 'e')
    {
      moveY += 100;
    }

    for (int i=0; i<attractors.length; i++)
    {
      attractors[i] = new PVector(moveX, moveY, moveZ);
    }
  }
}


void keyPressed() 
{
  if (key == 'P' || key == 'p') { // Press R to save the file
    record = true;
  }
}

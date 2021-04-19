class Fly
{
  PVector[] trail; 
  PVector pos;
  PVector vel;
  float speed;
  color col;
  float threshold = 20;

  Fly()
  {
    pos = new PVector(random(-200, 0), random(-200, 0), random(-200, 0));  
    vel = new PVector(1, 1, 1); 
    vel.normalize();
    speed = random(5,10);
    col = color(#0B65B2);
    trail = new PVector[0];
  }
   void display() {
        //Vehicle is a triangle pointing in the direction of velocity; since it is drawn pointing up, we rotate it an additional 90 degrees.
    float theta = vel.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    rotate(theta);
    beginShape();
    vertex(0, -3*2);
    vertex(-3, 3*2);
    vertex(3, 3*2);
    endShape(CLOSE);
    popMatrix();
  }
  
  void addTrail()
  {
    PVector currentPos = new PVector(pos.x, pos.y, pos.z);
    trail = (PVector[]) append(trail, currentPos);
  }

  void drawTrail()
  {
    noFill();
    strokeWeight(1);
    stroke(col);
    beginShape();                          
    for (int i=0; i<trail.length; i++) 
    {
      curveVertex(trail[i].x, trail[i].y, trail[i].z);
    }
    endShape();
  }

  void moveAttractors(Fly[] swarm, PVector[] att)
  {  
    int closestAtt = -1;
    float closestAttD = 1000000000;
    for (int i=0; i<att.length; i++)
    {
      float d = PVector.dist(pos, att[i]);
      if (d<closestAttD)
      {
        closestAtt = i;
        closestAttD = d;
      }
    }
    int closest = -1;
    float closestDist = 1000000000;
    for (int i=0; i<swarm.length; i++)
    {
      float d = PVector.dist(pos, swarm[i].pos);
      if ( swarm[i] != this && d<closestDist)
      {
        closest = i;
        closestDist = d;
      }
    }
    
    if (closestDist > threshold)  //separation
    {
      PVector attDir = PVector.sub(att[closestAtt], pos);   
      attDir.normalize();
      vel.add(attDir);
    } else                                    
    {
      PVector closestDir = PVector.sub(swarm[closest].pos, pos);  
      closestDir.normalize();
      vel.sub(closestDir);
    }

    vel.normalize();
    vel.mult(speed);
    pos.add(vel);
    
   
    
  }
}

// Declare and contruct two objects (h1, h2) from the class HLine

ArrayList sent;

String[] sentence1 = {"i", "am", "tall"};
String[] sentence2 = {"i", "am", "nice"};
  



int numRiffs = 5;
Riff[] riffs  = new Riff[numRiffs];
int sz = 1000;
int v = 100;
float drag = .94;

void setup()
{
 

 size(1000, 600, P3D);
 frameRate(30);
 for (int i = 0; i < numRiffs; i++) {
   riffs[i] = new Riff();
 }

}

void draw() {

 background(0);
 
  textSize(100);
  stroke(120,120,120);
  for(int i = 0; i < sentence1.length; i++){
  text(sentence1[i], random(height/2), random(width/2), 0);
  }
  
 
 camera(3000*(cos(mouseX*2*PI/width)), 0,
3000*(sin(mouseX*2*PI/width)), 0, 0, 0,
      0.0, 1.0, 0.0);
 for (int i = 0; i < numRiffs; i++) {

   riffs[i].move();
   riffs[i].display();
 }
 for (int i = 0; i < numRiffs; i++) {
   riffs[i].connect();
 }

}

class Riff {
 int numParents = int(random(2));
 int numChildren = int(random(10));
 int[] parents = new int[numParents];
 int[] children = new int[numChildren];
 float x, y, z, vx, vy, vz;
 Riff () {

 for (int i = 0; i < numParents; i++) {
   parents[i] = int(random(numRiffs));
 }

   for (int i = 0; i < numChildren; i++) {
   children[i] = int(random(numRiffs));
 }

 x = random(-sz,sz);
 y = random(-sz,sz);
 z = random(-sz,sz);
 vx = random(-v,v); vy = random(-v,v); vz = random(-v,v);

 }
 void connect() {
   for (int i = 0; i < numParents; i++) {
     stroke(0,0,255);
   line(x, y, z, riffs[parents[i]].x, riffs[parents[i]].y,
riffs[parents[i]].z);
 }

   for (int i = 0; i < numChildren; i++) {
     stroke(255,0,0);
   line(x, y, z, riffs[children[i]].x, riffs[children[i]].y,
riffs[children[i]].z);
 }
 }
 void display(){
   fill(255);
   pushMatrix();
   translate(x,y,z);
   sphere(10);
   popMatrix();
 }
 void move(){
   if((x>=sz)||(x<=-sz)){vx = -vx;}
   if((y>=sz)||(y<=-sz)){vy = -vy;}
   if((z<=-sz)||(z>=sz)){vz = -vz;}
   x = (x+ vx)*drag;//%width+1;
   y = (y+ vy)*drag;//%height+1;
   z = (z+ vz)*drag;//%height+1;
 }

}
//Here is a comment see if it appears~!
void mouseDragged()
{
rotateX(mouseY*2*PI/height);
}

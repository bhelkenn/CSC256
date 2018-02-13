//
//       CSc 310 Project 1 Two-Particle Simulation
//       by William Hsu
//       9/27/2011
//
//       There is a red particle and a green particle in a box.
//       The box has (x,y) coordinates 0 <= x <= 10, 0 <= y <= 10.
//       The user enters initial (x,y) coordinates for the two
//       particles. The velocity of a particle is given as
//       an (x,y) pair, where each coordinate is the distance
//       the particle moves in that direction, in one cycle.
//       Initially, the red particle starts with velocity (1,1), 
//       and the green particle starts with velocity (-1,-1).
//
//       The program simulates the movement of the two particles.
//       When a particle reaches a wall, it will bounce
//       off the wall. When the two particles are too close together,
//       they will collide and the simulation will end.
//
//       Each particle is represented by an array of four ints.
//       Element 0 and 1 are the (x,y) coordinates of the particle.
//       Element 2 and 3 are the (x,y) velocity components of the 
//       particle.

#include <iostream>
using std::cin;
using std::cout;
using std::endl;

void updatePoint(int *);
int findDistance(int, int, int, int);

int main()
{
  int redData[4], greenData[4];
  int i,cycle=0, dist;

  // set initial conditions

  redData[2] = 1;
  redData[3] = 1;
  greenData[2] = -1;
  greenData[3] = -1;

  cout << "Enter x-coordinate for red particle (0 to 10):";
  cin >> redData[0];
  cout << "Enter y-coordinate for red particle (0 to 10):";
  cin >> redData[1];
  cout << "Enter x-coordinate for green particle (0 to 10):";
  cin >> greenData[0];
  cout << "Enter y-coordinate for green particle (0 to 10):";
  cin >> greenData[1];

  do {
    // display state of particles
    cout << "cycle " << cycle << endl;
    cout << "red particle (x,y,xVel,yVel): " << redData[0] << " " << redData[1]
         << " " << redData[2] << " " << redData[3] << endl;
    cout << "green particle (x,y,xVel,yVel): " << greenData[0] << " "
         << greenData[1] << " " << greenData[2] << " " << greenData[3]
         << endl << endl;

    // update particle positions and velocities
    updatePoint(redData);
    updatePoint(greenData);

    // check distance between particles
    dist = findDistance(redData[0], redData[1], greenData[0], greenData[1]);
    cycle++;
  } while ((dist > 2) && (cycle < 10));

  if (dist <= 2) {
    cout << "Collison: oops, end of simulation!\n";
    cout << "red particle (x,y,xVel,yVel): " << redData[0] << " " << redData[1]
         << " " << redData[2] << " " << redData[3] << endl;
    cout << "green particle (x,y,xVel,yVel): " << greenData[0] << " "
         << greenData[1] << " " << greenData[2] << " " << greenData[3]
         << endl << endl;
  }

}

// update position and velocity of particle
// arg is array of data for particle

void updatePoint(int *arg)
{
  int distance;

  distance = findDistance(arg[0],arg[1],0,-1);
  if ((distance < 1) && (arg[2] < 0))
    arg[2] = - arg[2];
  distance = findDistance(arg[0],arg[1],10,-1);
  if ((distance < 1) && (arg[2] > 0))
    arg[2] = - arg[2];
  distance = findDistance(arg[0],arg[1],-1,0);
  if ((distance < 1) && (arg[3] < 0))
    arg[3] = - arg[3];
  distance = findDistance(arg[0],arg[1],-1,10);
  if ((distance < 1) && (arg[3] > 0))
    arg[3] = - arg[3];
  arg[0] = arg[0] + arg[2];
  arg[1] = arg[1] + arg[3];
  return;
}

// find Manhattan distance between two particles, or between
// a particle and a wall
// (arg0,arg1) are the (x,y) coordinates for first particle/wall
// (arg2,arg3) are the (x,y) coordinates for second particle/wall

int findDistance(int arg0, int arg1, int arg2, int arg3)
{
  int distX, distY;

  distX = arg0 - arg2;
  if (distX < 0)
    distX = - distX;
  distY = arg1 - arg3;
  if (distY < 0)
    distY = - distY;
  if ((arg0 < 0)  || (arg2 < 0))
    return distY;
  else if ((arg1 < 0)  || (arg3 < 0))
    return distX;
  else
    return distX + distY;
}

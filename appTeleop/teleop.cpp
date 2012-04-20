#include "mrcore/mrcore.h"


#include <iostream>
#include "glutapp.h"
#include "reactivecontrol.h"
#include "trajcontrol.h"

using namespace mr;
using namespace std;

class MyGlutApp: public GlutApp
{
public:
	MyGlutApp(string name,MobileRobot* r):GlutApp(name),robot(r)
	{
		world+=robot;
		scene.addObject(&world);
		scene.SetViewPoint(35,160,25);	
		va=vg=0;

		vector<Vector2D> path;
		path.push_back(Vector2D(0,0));
		path.push_back(Vector2D(20,0));
		path.push_back(Vector2D(20,10));
		path.push_back(Vector2D(-1,10));
		path.push_back(Vector2D(-1,1));
		traj.setPath(path);
	}
	void Draw(void)
	{
		scene.Draw();
		traj.drawGL();
		control.drawGL();
	}
	void Timer(float time)
	{
		Odometry odom;
		LaserData laserData;

		robot->getOdometry(odom);
		robot->getLaserData(laserData);

		//The odometry is full 3D, lets handle it only in 2D, as a Pose (x, y, theta)
		Transformation3D pose=odom.pose;
		double roll,pitch,yaw;
		pose.orientation.getRPY(roll,pitch,yaw);
		Pose2D robotPose(pose.position.x,pose.position.y,yaw);

	//	traj.setData(robotPose);
	//	traj.getSpeed(va,vg);

	//	control.setCommand(va,vg);
	//	control.setData(laserData);
		float va2=va,vg2=vg;
	//	control.getSpeed(va2,vg2);	
		robot->move(va2,vg2);
	}
	void Key(unsigned char key)
	{
		if(key=='a')
			vg+=0.05;
		else if(key=='d')
			vg-=0.05;
		else if(key=='s')
			va-=0.05;
		else if(key=='w')
			va+=0.05;
		else 
		{
			va=vg=0;
		}
	}
	void MouseMove(int x,int y)
	{
		scene.MouseMove(x,y);
		glutPostRedisplay();
	}
	void MouseClick(int b,int state, int x,int y)
	{
		bool down=(state==GLUT_DOWN);
		int button;
		if(b==GLUT_LEFT_BUTTON)
			button=MOUSE_LEFT_BUTTON;
		if(b==GLUT_RIGHT_BUTTON)
			button=MOUSE_RIGHT_BUTTON;
			
		int specialKey = glutGetModifiers();
		bool ctrlKey= (specialKey & GLUT_ACTIVE_CTRL)?true:false ;
		bool sKey= specialKey&GLUT_ACTIVE_SHIFT ;
		
		scene.MouseButton(x,y,b,down,sKey,ctrlKey);
		glutPostRedisplay();
	}
private:
	float vg,va;
	GLScene scene;
	World world;
	MobileRobot* robot;
	ReactiveControl control;
	TrajControl traj;
};

void printUsage();

int main(int argc,char* argv[])
{
/*	if(argc!=2)
	{
		printUsage();
		return -1;
	}
	string configFile(argv[1]);

	int port=-1;
	if(robotname=="nemo")
		robot=new Nemo;*/
	MobileRobot* robot=new Neo();
	robot->connectClients("127.0.0.1",13000);
	MyGlutApp myApp("teleop",robot);
	myApp.Run();
	return 0;   
}

void printUsage()
{
	cout<<"-------- Usage -----------------"<<endl;
	cout<<"> teleop config.txt    "<<endl;
	cout<<"example:    "<<endl;
	cout<<"> teleop neo 127.0.0.1 13000    "<<endl;
}
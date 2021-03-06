//#include "mrcore/mrcore.h"    //Funciona, pero NetBeans no reconoce los comandos
#include "/usr/local/mrcore/include/mrcore/mrcore.h"


#include <iostream>
#include "glutapp.h"

#include "PathControl/ADSK.h"
#include "PathControl/AngDistToSeg.h"
#include "PathControl/Angular.h"
#include "PathControl/CalculoError.h"
#include "PathControl/Control.h"
#include "ReactiveControl/ControlReactivo.h"
#include "ReactiveControl/Vision2D.h"

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
                controlangular=new Angular();
                controldistancia=new AngDistToSeg();
                controlboth=new ADSK();
                STOP=false;
                savedata=false;
                readData=false;
	}
	void Draw(void)
	{
		scene.Draw();
		//traj.drawGL();
		controlboth->drawGL();
                vision2d.drawGL();
                reactivecontrol.Draw();
                                
	}
	void Timer(float time)
	{
		Odometry odom;
		LaserData laserData;

		robot->getOdometry(odom);
		robot->getLaserData(laserData);

		//The odometry is full 3D, lets handle it only in 2D, as a Pose (x, y, theta)
		//Transformation3D pose=odom.pose;
		//double roll,pitch,yaw;
		//pose.orientation.getRPY(roll,pitch,yaw);
		//Pose2D robotPose(pose.position.x,pose.position.y,yaw);
                
                controlboth->SetPose(odom);
                controlboth->GetVel(va,vg);
                
                vision2d.SetPose(odom);
                vision2d.SetLaser(laserData);
                                
                reactivecontrol.SetPoseVision(vision2d);
                reactivecontrol.SetCommand(va,vg);

		float va2=va,vg2=vg;
                
                reactivecontrol.GetVel(va2, vg2);
                
//                //Decision
//                if (reactivecontrol.GetDistanceOk()) {
//                    //danger
//                    reactivecontrol.SetGetVel(va2, vg2);
//
//                } else {
//                    //cout<<"Sin Objetos Cerca"<<endl;
//                }
                
                if (STOP)
                    va2 = vg2 = 0.0f;
                

		robot->move(va2,vg2);
                
                
                /***************************
                 **********************
                if (globalAux) {
                    vision2D.Save();
                    controlreactivo.Save();
                    globalAux = false;
                }
                if (savedata) {
                    if (c_angular)
                        controlangular->Save();
                    if (c_distancia)
                        controldistancia->Save();
                    if (c_k)
                        controladsk->Save();

                    savedata = false;
                }

                if (readData) {
                    if (c_angular)
                        calculoerror.ReadFile();
                    if (c_distancia)
                        calculoerror.ReadFile();
                    if (c_k)
                        calculoerror.ReadFile();

                    readData = false;
                }
                 ******************************
                 **************************/
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
        
        //TrajControl traj;
        Control *controlboth;      //De moment, para que el path input pueda cogerlo
private:
	float vg,va;
	GLScene scene;
	World world;
	MobileRobot* robot;

        //Control
        Control *controlangular;
        Control *controldistancia;
        CalculoError calculoerror;
        Vision2D vision2d;
        ControlReactivo reactivecontrol;
        
        bool STOP;
        //Save&read
        bool savedata;
        bool readData;

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
    
    	string text;
	if(argc==2)
		text=string(argv[1]);
	else
	{
		cout<<"You have not specify a configuration file as command line parameter"<<endl;
		cout<<"Please type configuration file: ";
		string text;
		cin>>text;
	}
	cout<<"Loading configuration file: "<<text<<endl;
                
	MobileRobot* robot=new Neo();
	robot->connectClients("127.0.0.1",13000);
	MyGlutApp myApp("teleop",robot);
        
        //Leer archivo
	std::ifstream file(text.c_str());
        if (!file.is_open()) {
            printf("File not found!!\n");
        }
        vector<Vector2D> path;
        path.clear();
        int numpath;
        file>>numpath;
        path.resize(numpath);
        for (int i = 0; i < numpath; i++) {
            file>>path[i].x>>path[i].y;
        }
        file.close();
        
        vector<Vector3D> auxpath;       //Hasta que SetTray reciba vectores2d
        auxpath.clear();
        auxpath.resize(path.size());
        for (int i = 0; i < path.size(); i++) {
            auxpath[i].x=path[i].x;
            auxpath[i].y=path[i].y;
            auxpath[i].z=0.0;
        }

        myApp.controlboth->SetTray(auxpath);
        //Fin leer archivo
        
        string auxkey;
        cout<<"Any key to start "<<endl;
        cin>>auxkey;
        
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
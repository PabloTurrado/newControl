/* 
 * File:   Vision2D.cpp
 * Author: alex
 * 
 * Created on 13 de abril de 2012, 12:02
 */

#include "../globalFunctions.h"

#include "Vision2D.h"

Vision2D::Vision2D() {

    //Pose
    roll = 0.0f;
    yaw = 0.0f;
    pitch = 0.0f;
    //Laser
    pointLaser.clear();
    pointKinect2D.clear();
    range.clear();
    anglelaser.clear();
    startangle = 0.0f;
    steplaser = 0.0f;
    rangeKinect2D.clear();
    indexObject.clear();
    pointsObject.clear();
    rangeObject.clear();

}

Vision2D::Vision2D(const Vision2D& orig) {
}

Vision2D::~Vision2D() {
}

void Vision2D::SetPose(Odometry odometry) {
    pos = odometry.pose.position;
    odometry.pose.orientation.getRPY(roll, pitch, yaw);
}

void Vision2D::SetLaser(LaserData laserdata) {
    //1.01229097=58° -> Field of View (Horizontal, Vertical, Diagonal) = 58° H, 45° V, 70° D
    //1.01229097/2=0.506145485   
    //resolution appears to be 1200x960 pixels at a framerate of 30Hz
    //Deberia ser 1200 puntos en horizontal pero no deja mas de 541 puntos, src/data/laserdata.h mal¿?
    //Operation range = 0.8m - 3.5m  //dejamos el por defecto, 10 metros
    //numstep=1.01229097/541=0.00187115;


    //laserdata.setProperties(-0.506145485,0.00187115,541);
    pointLaser = laserdata.getPoints();
    anglelaser = laserdata.getAngles();
    range = laserdata.getRanges();
    startangle = laserdata.getStartAngle();
    steplaser = laserdata.getStep();
    //*****AUNQUE CAMBIE LAS PROPIEDADES, EL RANGE SIGUE MARCANDO COMO SI NO LO HUBIESE HECHO¡¡¡¡!!!!!

    //MANUALMENTE,el angulo +-0.50614 va del index 212-328, el rango que sea 8metros
    pointKinect2D.clear();
    pointKinect2D.resize(117); //328-212+1, incluyen ambos
    rangeKinect2D.clear();
    rangeKinect2D.resize(117);
    int j = 0;
    for (int i = 212; i <= 328; i++) {
        pointKinect2D[j] = pointLaser[i];
        rangeKinect2D[j] = range[i];
        j++;
    }

    indexObject.clear();
    rangeObject.clear();
    for (int i = 0; i < pointKinect2D.size(); i++) {
        if (rangeKinect2D[i] < 8.0) { //Rango en que la Kinect detecta obstaculos
            indexObject.push_back(i); //Guardamos el indice de los objetos, que junto a el vector points
            rangeObject.push_back(rangeKinect2D[i]); //Sabremos donde esta el objeto (Haciendo la correspondiendte transformacion)
        }
    }
    Object();

}

void Vision2D::Object() {
    vector <Vector2D> pointsTrans;
    pointsTrans.clear();
    pointsTrans.resize(pointKinect2D.size());
    //Transformacion
    for (int i = 0; i < pointKinect2D.size(); i++) {
        pointsTrans[i] = gf::TransformationRT2D(pointKinect2D[i], yaw, Vector2D(pos.x, pos.y));
    }

    pointsObject.clear();
    pointsObject.resize(indexObject.size());

    for (int i = 0; i < indexObject.size(); i++) {
        pointsObject[i] = pointsTrans[indexObject[i]];
    }

}

void Vision2D::GetData(vector<Vector2D>& point_, vector<double>& range_,
        double& yaw_, Vector2D& pos_, vector<Vector2D>& pointsObject_, vector<double> &rangeObject_) {
    point_ = pointKinect2D;
    range_ = rangeKinect2D;
    yaw_ = yaw;
    pos_.x = pos.x;
    pos_.y = pos.y;
    pointsObject_ = pointsObject;
    rangeObject_ = rangeObject;
}

void Vision2D::Save() {

    std::ofstream file("logs/data/Laser2D.txt");
    file << "puntosLaser " << pointLaser.size() << endl;
    file << "startangle " << startangle << endl;
    file << "step " << steplaser << endl;

    for (int i = 0; i < pointLaser.size(); i++) {
        file << i << " " << "x: " << pointLaser[i].x << " y: " << pointLaser[i].y
                << " angle:" << anglelaser[i].getValue()
                << " range: " << range[i] << endl;
    }
    file.close();


}

void Vision2D::drawGL() {
    glPushMatrix();
    
    //Cono horiztontal de angulo de vision Kinect2D
    Vector2D limInf = gf::TransformationRT2D(pointKinect2D[0], yaw, Vector2D(pos.x, pos.y));
    Vector2D limSup = gf::TransformationRT2D(pointKinect2D[116], yaw, Vector2D(pos.x, pos.y));

    glLineWidth(1.0);
    glColor3ub(0, 200, 0);
    
    glBegin(GL_LINES);
    glVertex3f(pos.x, pos.y, 0.4); // V0
    glVertex3f(limInf.x, limInf.y, 0.4); // V1
    glEnd();
    glBegin(GL_LINES);
    glVertex3f(pos.x, pos.y, 0.4); // V0
    glVertex3f(limSup.x, limSup.y, 0.4); // V1
    glEnd();

    //Puntos de los objetos (VERDE)
    glPointSize(1.0);
    for (int i = 0; i < pointsObject.size(); i++) {
        glBegin(GL_POINTS);
        glVertex3f(pointsObject[i].x, pointsObject[i].y, 0.4);
        glEnd();
    }

    glPopMatrix();
}
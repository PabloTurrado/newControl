/* 
 * File:   ControlReactivo.cpp
 * Author: alex
 * 
 * Created on 14 de abril de 2012, 12:43
 */

#include <GL/freeglut_std.h>

#include "ControlReactivo.h"
#include "../globalFunctions.h"

ControlReactivo::ControlReactivo() {
    range.clear();
    points.clear();
    indexObjectDanger.clear();
    pointsObjectDanger.clear();
    pointsObject.clear();
    rangeObject.clear();
    rangeAction = 2;
    danger = false;
}

ControlReactivo::ControlReactivo(const ControlReactivo& orig) {
}

ControlReactivo::~ControlReactivo() {
}

void ControlReactivo::SetPoseVision(vector<Vector2D> point_, vector<double> range_,
        double yaw_, Vector2D pos_, vector<Vector2D> pointsObject_, vector<double> rangeObject_) {
    points = point_;
    range = range_;
    yaw = yaw_;
    pos2 = pos_;
    pointsObject = pointsObject_;
    rangeObject = rangeObject_;
    ObjectDanger();
}

bool ControlReactivo::ObjectDanger() {
    danger = false;
    pointsObjectDanger.clear();
    indexObjectDanger.clear();
    indexObjectDanger.resize(rangeObject.size());
    for (int i = 0; i < rangeObject.size(); i++) {
        if (rangeObject[i] < rangeAction) { //Distancia menor que 2.5 metros, danger
            danger = true;
            indexObjectDanger[i] = 1;
            pointsObjectDanger.push_back(pointsObject[i]);
        } else
            indexObjectDanger[i] = 0;
    }

}

void ControlReactivo::SetGetVel(float &va, float &vg) {
    float vela = va;
    float velg = vg;

    Compute(vela, velg);

    va = outputAvance;
    vg = velg;
}

void ControlReactivo::Compute(float vela, float velg) {

    //****** 1) Velocidad de avance disminuye cuando se acerca a objeto

    float auxrangeMin = rangeAction;
    if (pointsObjectDanger.size() > 0) {
        for (int i = 0; i < range.size(); i++) {
            if (range[i] < auxrangeMin)
                auxrangeMin = range[i];
        }

    }
    //Habrá que verlo con los puntos mas cercanos al eje del robot, no con todos.

    float kequivalente = 0.8; //El minimo será a 40cm, que restandolo dará velocidad =0
    float error = vela - kequivalente * (1 / auxrangeMin);
    if (error < 0) error = 0;

    outputAvance = 1 * error;

}

void ControlReactivo::Save() {

    std::ofstream file("logs/data/Kinect2D(CtrlReact).txt");
    file << "puntosKinect: " << points.size() << endl; //Si queremos XY de los puntos en total, habra que transformarlos
    file << "objects: " << pointsObject.size() << endl;
    file << "objectsDanger: " << pointsObjectDanger.size() << endl;

    for (int i = 0; i < pointsObject.size(); i++) {
        file << i << " pointsObject: " << pointsObject[i] << " range: " << rangeObject[i]
                << " danger?: " << indexObjectDanger[i] << endl;
    }
    file << "********************************************" << endl;
    for (int i = 0; i < pointsObjectDanger.size(); i++) {
        file << i << " pointsDanger: " << pointsObjectDanger[i] << endl;
    }

    file.close();
}

void ControlReactivo::Draw() {

    glPushMatrix();
    //Puntos Peligrosos (menor que rangeAction)
    glPointSize(2.0);
    glColor3ub(255, 0, 0);
    for (int i = 0; i < pointsObjectDanger.size(); i++) {
        glBegin(GL_POINTS);
        glVertex3f(pointsObjectDanger[i].x, pointsObjectDanger[i].y, 0.4);
        glEnd();
    }
    glPopMatrix();

}
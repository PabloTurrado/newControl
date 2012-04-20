/* 
 * File:   ControlReactivo.h
 * Author: alex
 *
 * Created on 14 de abril de 2012, 12:43
 */

#ifndef CONTROLREACTIVO_H
#define	CONTROLREACTIVO_H

#include "/usr/local/mrcore/include/mrcore/mrcore.h"
#include <iostream>

class ControlReactivo {
public:
    ControlReactivo();
    ControlReactivo(const ControlReactivo& orig);
    virtual ~ControlReactivo();

    void SetPoseVision(vector<Vector2D> point_, vector <double> range_, double yaw_,
            Vector2D pos_, vector<Vector2D> pointsObject_, vector<double> rangeObject_);

    inline bool GetDistanceOk() {
        return danger;
    };
    void SetGetVel(float &, float &);

    void Save();
    void Draw();

private:
    bool ObjectDanger();
    void Compute(float vela, float velg);

    vector <double> range;
    vector <Vector2D> points;
    vector <int> indexObjectDanger;
    vector <Vector2D> pointsObjectDanger;
    vector <Vector2D> pointsObject;
    vector<double> rangeObject;
    double rangeAction;

    double yaw;
    Vector2D pos2;

    float outputGiro, outputAvance;
    bool danger;
    float rangeNeo;

};

#endif	/* CONTROLREACTIVO_H */


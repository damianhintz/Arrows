/* 
 * File:   arrowBuilder.h
 * Author: DHintz
 *
 * Created on 25 sierpnia 2016, 12:40
 */

#ifndef ARROWBUILDER_H
#define ARROWBUILDER_H
#include "app.h"
#include "core.h"
#include "vectorMath.h"

typedef struct _arrowBuilder {
    int arrowsCount;
    int allCount;
} ArrowBuilder, *LpArrowBuilder;

void arrowBuilder_init(LpArrowBuilder thisP);
void arrowBuilder_free(LpArrowBuilder thisP);
void arrowBuilder_summary(LpArrowBuilder thisP);
void arrowBuilder_createArrows(LpArrowBuilder thisP);
int arrowBuilder_createArrow(MSElement* lineP, DPoint3d* startPoint, DPoint3d* endPoint);

#endif /* ARROWBUILDER_H */

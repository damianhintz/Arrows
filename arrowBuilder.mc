#include "arrowBuilder.h"

void arrowBuilder_init(LpArrowBuilder thisP) {
    if (thisP == NULL) return;

    thisP->arrowsCount = 0;
    thisP->allCount = 0;
}

void arrowBuilder_free(LpArrowBuilder thisP) {
}

void arrowBuilder_summary(LpArrowBuilder thisP) {
    char msg[256];
    sprintf(msg, "arrows summary: %d/%d arrow[s] added (level %d)",
            thisP->arrowsCount, thisP->allCount, _arrowLevel);
    mdlLogger_info(msg);
}

void arrowBuilder_createArrows(LpArrowBuilder thisP) {
    char row[256];
    char msg[256];
    FILE* file;
    char fileName[MAXFILELENGTH];
    char dev[MAXDEVICELENGTH];
    char dir[MAXDIRLENGTH];
    char name[MAXNAMELENGTH];
    int rowIndex = 0;

    mdlFile_parseName(tcb->dgnfilenm, dev, dir, name, NULL);
    mdlFile_buildName(fileName, dev, dir, name, "arr");
    
    file = mdlTextFile_open(fileName, TEXTFILE_READ);
    
    if (file == NULL) return;

    while (NULL != mdlTextFile_getString(row, 256, file, TEXTFILE_DEFAULT)) {
        MSElement lineP;
        DPoint3d startPoint, endPoint;
        int scanned;
        
        rowIndex++;

        if (strncmp(row, "#", 1) == 0) continue;

        thisP->allCount++;
        
        scanned = sscanf(row, "%f %f %f %f", &startPoint.x, &startPoint.y, &endPoint.x, &endPoint.y);
        
        if (scanned != 4) {
            sprintf(msg, "arrows invalid row %d: %s", rowIndex, row);
            mdlLogger_info(msg);
            continue;
        }
        
        if (arrowBuilder_createArrow(&lineP, &startPoint, &endPoint))
        {
            mdlElement_add(&lineP);
            thisP->arrowsCount++;
        }
    }
    
    mdlTextFile_close(file);
}

int arrowBuilder_createArrow(MSElement* lineP, DPoint3d* startPoint, DPoint3d* endPoint) {
    DPoint3d points[6];
    DPoint3d normal, left, right, middle, first, last;
    double distance;
    
    distance = mdlVec_distance(startPoint, endPoint);
    mdlVec_computeNormal(&normal, endPoint, startPoint);
    mdlVec_scale(&normal, &normal, distance / 10);
    
    first = *startPoint;
    last = *endPoint;
    
    middle.z = 0;
    middle.y = last.y - normal.y * 2;
    middle.x = last.x - normal.x * 2;
    
    left.z = 0;
    left.y = middle.y + normal.x;
    left.x = middle.x - normal.y;
    
    right.z = 0;
    right.y = middle.y - normal.x;
    right.x = middle.x + normal.y;
    
    points[0] = first;
    points[1] = middle;
    points[2] = left;
    points[3] = last;
    points[4] = right;
    points[5] = middle;
    
    return SUCCESS == mdlLineString_create(lineP, NULL, points, 6);
}

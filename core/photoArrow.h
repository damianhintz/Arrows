/* 
 * File:   photoArrow.h
 * Author: DHintz
 *
 * Created on 31 sierpnia 2016, 12:35
 */

#ifndef PHOTOARROW_H
#define PHOTOARROW_H
#include "app.h"
#include "photoPoint.h"

typedef struct _photoArrow {
    char name[MAX_PHOTO_NAME];
    DPoint3d startPoint;
    DPoint3d endPoint;
} PhotoArrow, *LpPhotoArrow;

#endif /* PHOTOARROW_H */


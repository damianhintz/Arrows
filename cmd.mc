#include "cmd.h"

void command_loadArrows() {
    ArrowBuilder builder;
    
    mdlLogger_info("arrows: loadArrows start");
    
    //build arrows
    arrowBuilder_init(&builder);
    arrowBuilder_createArrows(&builder);
    arrowBuilder_summary(&builder);

    //free resources
    arrowBuilder_free(&builder);
    
    mdlLogger_info("arrows: loadArrows end");
}

void command_loadConfig() {
    char row[256];
    FILE* file;
    mdlLogger_info(_configPath);
    file = mdlTextFile_open(_configPath, TEXTFILE_READ);
    if (file == NULL) return;
    while (NULL != mdlTextFile_getString(row, 256, file, TEXTFILE_DEFAULT)) {
        if (strncmp(row, "#", 1) == 0) continue; //skip keyin
        mdlInput_sendKeyin(row, 0, 0, NULL);
    }
    mdlTextFile_close(file);
}

void command_arrowLevel(int level) {
    char msg[256];
    _arrowLevel = level;
    mdlParams_setActive((void*) _arrowLevel, ACTIVEPARAM_LEVEL);
    sprintf(msg, "command_arrowLevel: %d", _arrowLevel);
    mdlLogger_info(msg);
}

void command_arrowColor(int color) {
    char msg[256];
    _arrowColor = color;
    mdlParams_setActive((void*) _arrowColor, ACTIVEPARAM_COLOR);
    sprintf(msg, "command_arrowColor: %d", _arrowColor);
    mdlLogger_info(msg);
}

void command_arrowStyle(int style) {
    char msg[256];
    _arrowStyle = style;
    mdlParams_setActive((void*) _arrowStyle, ACTIVEPARAM_LINESTYLE);
    sprintf(msg, "command_arrowStyle: %d", _arrowStyle);
    mdlLogger_info(msg);
}

void command_arrowWeight(int weight) {
    char msg[256];
    _arrowWeight = weight;
    mdlParams_setActive((void*) _arrowWeight, ACTIVEPARAM_LINEWEIGHT);
    sprintf(msg, "command_arrowWeight: %d", _arrowWeight);
    mdlLogger_info(msg);
}

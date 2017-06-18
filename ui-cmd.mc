#include "cmd.h"

Public cmdName void cmd_photoReferences(char* unparsedP) cmdNumber CMD_ARROWS_LOAD_ARROWS {
    command_loadArrows();
}

Public cmdName void cmd_loadConfig(char* unparsedP) cmdNumber CMD_ARROWS_LOAD_CONFIG {
    //mdlLogger_info("photoarrow: START");
    command_loadConfig();
    //mdlLogger_info("photoarrow: END");
}

Public cmdName void cmd_arrowLevel(char* unparsedP) cmdNumber CMD_ARROWS_ARROW_LEVEL {
    int level = -1;
    if (1 != sscanf(unparsedP, "%d", &level)) {
        mdlLogger_info("photoarrow arrow level {level}");
        return;
    }
    command_arrowLevel(level);
}

Public cmdName void cmd_arrowColor(char* unparsedP) cmdNumber CMD_ARROWS_ARROW_COLOR {
    int color;
    if (1 != sscanf(unparsedP, "%d", &color)) {
        mdlLogger_info("photoarrow arrow color {color}");
        return;
    }
    command_arrowColor(color);
}

Public cmdName void cmd_arrowStyle(char* unparsedP) cmdNumber CMD_ARROWS_ARROW_STYLE {
    int style;
    if (1 != sscanf(unparsedP, "%d", &style)) {
        mdlLogger_info("photoarrow arrow style {style}");
        return;
    }
    command_arrowStyle(style);
}
Public cmdName void cmd_arrowWeight(char* unparsedP) cmdNumber CMD_ARROWS_ARROW_WEIGHT {
    int weight;
    if (1 != sscanf(unparsedP, "%d", &weight)) {
        mdlLogger_info("photoarrow arrow weight {weight}");
        return;
    }
    command_arrowWeight(weight);
}

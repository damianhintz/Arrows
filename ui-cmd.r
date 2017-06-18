#include <rscdefs.h>
#include <cmdclass.h>

#define CT_NONE 0
#define CT_MAIN 1
#define CT_MENU 10
#define CT_PHOTO 101
#define CT_REF 102
#define CT_ARROW 103
#define CT_LOAD 104

Table CT_MAIN =
{
    {1, CT_MENU, INHERIT, NONE, "arrows"},
};

Table CT_MENU =
{
    {1, CT_ARROW, INHERIT, NONE, "arrow"},
    {2, CT_LOAD, INHERIT, NONE, "load"},
};

Table CT_ARROW =
{
    {1, CT_NONE, INHERIT, NONE, "level"},
    {2, CT_NONE, INHERIT, NONE, "color"},
    {3, CT_NONE, INHERIT, NONE, "style"},
    {4, CT_NONE, INHERIT, NONE, "weight"},
};

Table CT_LOAD =
{
    {1, CT_NONE, INHERIT, NONE, "config"},
    {2, CT_NONE, INHERIT, NONE, "arrows"},
};

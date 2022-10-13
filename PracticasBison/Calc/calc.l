%{
    #include "calc.tab.h"
%}

%%
"+"         {return SUMA;}
"-"         {return RESTA;}
"*"         {return MULT;}
"/"         {return DIV;}
[0-9]+      {return ENTERO;}
"\n"        {return EOL;}
.           {}

%%
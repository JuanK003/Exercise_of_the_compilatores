

%{
    #include "calculadora.tab.h"
%}

%%
"+"        {return SUMA;}
"-"        {return RESTA;}
[0-9]+     {return ENTERO;}
";"        {return EOL;}
.        {}

%%
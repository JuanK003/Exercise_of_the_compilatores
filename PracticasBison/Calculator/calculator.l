%{
    #include "calc.tab.h"
%}

%%
"+"         {return SUMA;}
"-"         {return RESTA;}
"*"         {return MULT;}
"/"         {return DIV;}
[0-9]+      { yylval = atoi(yytext); return ENTERO;}
"\n"        {return EOL;}
.           {}

%%
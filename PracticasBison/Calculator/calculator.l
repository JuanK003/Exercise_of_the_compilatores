%{
#include "calculator.tab.h"
%}

%%
"+"         {return SUMA;}
"-"         {return RESTA;}
"*"         {return MULT;}
"/"         {return DIV;}
[0-9]+      { yylval.nint=atoi(yytext);}
"\n"        {return EOL;}
.           {return (yytext[0]);}

%%
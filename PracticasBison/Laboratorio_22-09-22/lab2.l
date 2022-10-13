
%{
    #include "lab2.tab.h"    
%}

%%

"const"             {return CONST;}
"define"            {return DEFINE;}
"#"                 {return NUMERAL;}
"int"               {return TIPINT;}
"float"               {return TIPFLO;}
"="                {return IGUAL;}
[A-Za-z]+    {return NOM;}
[0-9]+ {return INTE;}
[0-9]+\.[0-9]+      {return FLO;}
";"                   {return EOS;}
"\n"                {return EOL;}
.                   {}

%%
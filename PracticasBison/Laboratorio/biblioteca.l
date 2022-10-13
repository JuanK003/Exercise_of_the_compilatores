

%{
    #include "biblioteca.tab.h"    
%}

%%
"#"                 {return NUMERAL;}
"include"           {return INCLUDE;}
"<"                 {return PI;}
\"                  {return CM;}
[A-Za-z]{1,100}     {return LIB;}
"\.h"               {return EXT;}
">"                 {return PF;}
"\n"                {return EOL;}
.       {}

%%
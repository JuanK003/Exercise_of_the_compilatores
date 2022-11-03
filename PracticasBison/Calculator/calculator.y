%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();

%}

%union{
    int nint;
}

%token SUMA RESTA MULT DIV
%token <nint> ENTERO
%token EOL

%type <nint> expresion
%type <nint> termino
%type <nint> factor

%%
inicio  :   expresion EOL {printf("=%i", $1);}
        ;

expresion   :   expresion SUMA termino { $$ = $1 + $3;  }
            |   expresion RESTA termino { $$ = $1 - $3;  }
            |   termino
            ;

termino     :   termino MULT factor { $$ = $1 * $3;  }
            |   termino DIV factor { $$ = $1 / $3;  }
            |   factor  {$$ = $1; }
            ;

factor      :   ENTERO
            ;


%%


void yyerror(char *mensaje){
    fprintf(stderr, "ERROR: %s\n", mensaje);
}

int main(){
    yyparse();
    return 0;
}
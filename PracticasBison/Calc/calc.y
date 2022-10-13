%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();

%}

%token SUMA RESTA MULT DIV
%token ENTERO
%token EOL

%%

inicio : expresion EOL {printf("Sintaxis Correcta");} 
    ;

expresion : ENTERO operacion
          ;

simbolo :   SUMA
            | RESTA
            | MULT
            | DIV
        ;

operacion : simbolo ENTERO operacion
            |
          ;

%%

void yyerror(char *mensaje){
    fprintf(stderr, "ERROR: %s\n", mensaje);
}

int main(){
    yyparse();
    return 0;
}
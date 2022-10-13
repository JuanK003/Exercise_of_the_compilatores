%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();
%}

%token CONST DEFINE NUMERAL IGUAL 
%token  TIPINT TIPFLO
%token NOM INTE FLO
%token EOL EOS

%%

inicio : inicio sentencia EOL    {printf("Sintaxis Correcta\n");} 
        |
       ;

sentencia : CONST tipo NOM IGUAL numero EOS
            | NUMERAL DEFINE NOM numero
            ;

tipo : TIPINT | TIPFLO
        ;

numero : INTE | FLO
    ;

%%

void yyerror(char *mensaje){
    fprintf (stderr, "Error: %s\n", mensaje);
}

int main(){
    yyparse();
    return 0;
}
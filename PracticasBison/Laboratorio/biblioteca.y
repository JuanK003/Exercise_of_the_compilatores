 
%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();
%}

%token NUMERAL INCLUDE PI LIB EXT PF
%token CM
%token EOL

%%
inicio : NUMERAL INCLUDE sig LIB EXT sig2 EOL      {printf("Sintaxis Correcta\n");}
sig: PI | CM
sig2: PF | CM
       ;

%%

void yyerror(char *mensaje){
    fprintf (stderr, "Error: %s\n", mensaje);
}

int main(){
    yyparse();
    return 0;
}
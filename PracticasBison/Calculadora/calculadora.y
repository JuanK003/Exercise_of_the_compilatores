
%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();
%}

%token SUMA RESTA
%token ENTERO
%token EOL

%%

inicio : expresion EOL      {printf("Sintaxis Conrrecta\n");}
       ;
           
expresion : expresion SUMA expresion      {printf("Suma\n");}   
          | expresion RESTA expresion     {printf("Resta\n");}
          | ENTERO                        
          ;
%%

void yyerror(char *mensaje){
    fprintf (stderr, "Error: %s\n", mensaje);
}

int main(){
    yyparse();
    return 0;
}
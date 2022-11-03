%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();
%}

%union
{
double real;
int entero;
}
%token <real> TOK_REAL
%token <entero> TOK_ENTERO

%start linea
%left '+' '-'
%left '*' '/'

%type <entero> exp
%type <entero> exp_entera
%type <real> exp_real

%%
linea: exp '\n' {}
;
exp: exp_real {printf("%f\n", $1);}
|exp_entera {printf("%d\n", $1);}
;
exp_entera: TOK_ENTERO { $$ = $1;}
|exp_entera '+' exp_entera { $$ = $1 + $3;}
|exp_entera '-' exp_entera { $$ = $1 - $3;}
|exp_entera '*' exp_entera { $$ = $1 * $3;}
|exp_entera '/' exp_entera { $$ = $1 / $3;}
|'(' exp_entera ')' { $$ = $2;}
;
exp_real: TOK_REAL { $$ = $1;}
|exp_real '+' exp_real { $$ = $1 + $3;}
|exp_real '-' exp_real { $$ = $1 - $3;}
|exp_real '*' exp_real { $$ = $1 * $3;}
|exp_real '/' exp_real { if ($3) $$=$1/$3;
else $$=$1; }
|'(' exp_real ')' { $$ = $2;}
;

%%

void yyerror(char *mensaje){
    fprintf(stderr, "ERROR: %s\n", mensaje);
}

int main(){
    yyparse();
    return 0;
}
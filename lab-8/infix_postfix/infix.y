%{
#include <stdio.h>
int yylex(void);
void yyerror(char*);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
S       :   E       {printf("\n");}
        ;
E       :   E'+'E   {printf("+");}
        |   E'*'E   {printf("*");}
        | E '-' E {printf("-");}
        | E '/' E {printf("/");}
        | '(' E ')'
        | '-' E %prec UMINUS {printf("-");}
        | NUM {printf("%d", yylval);}
        ;
%%
int main(){
    yyparse();
    return 0;
}
void yyerror(char* errorText){
    printf("[ERROR] : %s\n",errorText);
}

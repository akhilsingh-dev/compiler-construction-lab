/*PROGRAM TO CHECK FOR WELL FORMEDNESS OF PARENTHESIS*/

%{
/* Definition Section*/
#include <stdio.h>
#include <string.h>
int num_brackets=0;
extern FILE *yyin;
%}

%%
 //RULES

"(" {printf("%s",yytext);++num_brackets;}
")" {printf("%s",yytext);--num_brackets;}
";" {printf(";\n");printf((num_brackets)?"Not Well Formed Equation\n":"Well Formed Equation\n");num_brackets=0;}
. {printf("%s",yytext);}
%%

int main(int argc, char *argv[]) {
    FILE *fp=fopen(argv[1],"r");
    yyin=fp;
    yylex();
    fclose(fp);    
    return 0 ;
}

int yywrap()
{
return 1;
}

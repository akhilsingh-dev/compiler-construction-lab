%{
#include <stdio.h>
int com_count = 0;
%}

%%

.*com\n     {++com_count; printf("Found line ending in \"com\": %s",yytext);}
\n\n          {return 0;}
.           ;
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("Number of lines ending in \"com\" : %d\n",com_count);
    return 0;
}
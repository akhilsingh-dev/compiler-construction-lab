%{
#include <stdio.h>
%}


%%
[0-9]+       {printf("0x%x",atoi(yytext));}

%%


int yywrap(){
    return 1;
}


int main(){

    char filename[50] = "dummy.txt";
    yyin = fopen(filename, "r+");

    yylex();
    printf("\n");
    return 0;
}


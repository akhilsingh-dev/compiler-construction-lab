%{
#include <stdio.h>

%}

%%
[A-Z]       {yytext[0] += 32;printf("%s",yytext);}
[a-z]       {yytext[0] -= 32;printf("%s",yytext);}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
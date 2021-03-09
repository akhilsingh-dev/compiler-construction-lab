%{
#include <stdio.h>
int count = 0;
%}


%%
A([A-Za-z]*)          {++count;}
.                     {}
%%


int yywrap(){
    return 1;
}


int main(){

    char filename[50] = "dummy.txt";
    yyin = fopen(filename,"r");
    yylex();
    printf("Number of words starting with A: %d\n",count);
    return 0;
}
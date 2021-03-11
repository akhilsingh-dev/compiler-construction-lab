%{
#include <stdio.h>
#include <stdlib.h>

const char* dec_to_hex(int num){
    char* hex = malloc(sizeof(char) * 10);
    sprintf(hex, "%x", num);
    return hex;
}
%}



%%
[0-9]+       {printf("0x%s",dec_to_hex(atoi(yytext)));}

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


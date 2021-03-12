%{
#include <stdio.h>
#include <stdlib.h>

char* dec_to_hex(int num);
%}


%%
[0-9]+       {char* tmp = dec_to_hex(atoi(yytext));printf("0x%s",tmp);free(tmp);}

%%

char* dec_to_hex(int num){
    char* hex = malloc(sizeof(char) * 10);
    sprintf(hex, "%x", num);
    return hex;
}

int yywrap(){
    return 1;
}

int main(){

    char filename[50] = "dummy.txt";
    yyin = fopen(filename, "r+");

    yylex();
    printf("\n");
    fclose(yyin);
    return 0;
}


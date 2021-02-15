/*PROGRAM TO IDENTIFY CAPITAL STRINGS FROM GIVEN STRING */

%{
/* Definition Section*/

%}

%%
 //RULES

[A-Z]+[ \t\n\,\.] {printf("%s",yytext);}
.   ; 
%%

int main() {
    printf("\nEnter a string with Capital words in between : ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

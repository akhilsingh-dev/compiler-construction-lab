/*PROGRAM TO PRINT YOUR NAME UPON PRESSING ENTER*/
%{
//Global declarations
#include <stdio.h>
char Name[10] ; // global declaration of var name
%}

%%
        //RULES
([A-Za-z0-9]+)/"\n" {printf("Hi %s Good Morning\n",yytext);
                return 0 ;}       // rule to print name upon detecting next line and then exit from yylex

%%

int main()
{  
    char opt; 
    do 
    {
        printf("What is your name : ");
        yylex();
        printf("Press any key to continue(Y/y) :");
        scanf("%c",&opt);
        getchar();
        
    }while((opt == 'y') || (opt == 'Y'));
    return 0;
}
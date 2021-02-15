/*PROGRAM TO CHECK FOR WELL FORMEDNESS OF PARENTHESIS*/

%{
/* Definition Section*/

#include <stdio.h>
#include <string.h>
char temp[10];
int i=0,openbracket=0,closedbracket=0;
extern FILE *yyin;
%}

%%
 //RULES

"("[()]*")"";" {
strcpy(temp,yytext);
printf("%s\n",temp);
i=0;
while(temp[i]!=';'){
if(temp[i]=='(') openbracket++;
if(temp[i]==')') closedbracket++;
else ;
i++;
}

if(openbracket==closedbracket) printf("WELL FORMED INPUT! \n");
else printf("not well formed Input! \n");
}

%%

int main(int argc, char *argv[])
{

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

%{
#include <stdio.h>
void yyerror(char*);
int yylex(void);
void codegen();
void codegen_assign();
void codegen_umin();
void printnum(int);
void push();
%}

%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left UMINUS
%%

S    :    ID{push();} '='{push();} E{codegen_assign();}
      ;
E    :    E '+'{push();} T{codegen();}
      |    E '-'{push();} T{codegen();}
      |    T
      ;
T    :    T '*'{push();} F{codegen();}
      |    T '/'{push();} F{codegen();}
      |    F
      ;
F    :    '(' E ')'
      |    '-'{push();} F{codegen_umin();} %prec UMINUS
      |    ID{push();}
      |    NUM{push();}
      ;

%%

#include "lex.yy.c"
#include<ctype.h>
#include<string.h>
char st[100][25];
int top=0,ptr=0;
int tint=0; int tintar[200];

int main()
{
    printf("Enter the expression : ");
    yyparse();
    return 0;
}

void push()
{
  strcpy(st[++top],yytext);
  ptr++;
}

void codegen(){
    printf("t%d = %s",tint,st[top-2]);
    printnum(2);
    printf(" %s %s",st[top-1],st[top]);
    printnum(0);
    printf("\n");
    top-=2;ptr-=2;
    strcpy(st[top],"t");
    tintar[ptr]=tint;
    tint++;
}

void codegen_umin(){
    printf("t%d = -%s\n",tint,st[top]);
    printnum(0);
    top--;ptr--;
    strcpy(st[top],"t");
    tintar[ptr]=tint;
    tint++;
}

void codegen_assign(){
    printf("%s = ",st[top-2]);
    printnum(2);
    printf("%s",st[top]);
    printnum(0);
    printf("\n");
    top-=2;ptr-=2;
}

void printnum(int n){
    if( strcmp(st[top-n],"t")==0)
    {
         printf("%d",tintar[ptr-n]);
    }
}

void yyerror(char* errorText){
    printf("[ERROR] : %s",errorText);
}
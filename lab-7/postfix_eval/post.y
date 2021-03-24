%{
    #include<stdio.h>
    #include<assert.h>
    #define STACK_SIZE 100

    void push(int val);
    int pop();
    int top();
    void yyerror();
%}


%token ID

%%
S : E {printf("=%d\n",top());}
  ;

E : E E '+' {push(pop() + pop());}
  | E E '-' {int temp=pop(); push(pop()-temp);}
  | E E '*' {push(pop()*pop());}
  | E E '/' {int temp=pop(); push(pop()/temp);}
  | ID      {push(yylval);}
  ;

%%

#include "lex.yy.c"


int stack[STACK_SIZE];
int i = -1;


void push(int val){
    assert(i < STACK_SIZE);
    stack[++i] = val;
}

int pop(){
    assert(i > -1);
    return stack[i--];
}

int top(){
    assert(i > -1);
    return stack[i];
}

int main(){
    yyparse();
    return 0;
}

void yyerror(){
    printf("error!");
}
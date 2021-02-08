%{
    //Global definitions
%}

%%
"HI" {printf("Hello World!");}
. {}
%%

int main() {
    yylex();
    return 0;
}
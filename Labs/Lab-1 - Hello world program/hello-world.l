%{
    /*Global Definations */
%}

%%
/*Enter Rules here . Rules section*/

"hi" {printf("Hello World");}   /*When hi is entered , print hello world*/
. {}                            /*no action for other inputs*/
%%

int main(){
    yylex();
    return 0;
}


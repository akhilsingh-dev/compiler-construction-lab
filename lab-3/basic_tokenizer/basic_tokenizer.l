%{
#include <stdio.h>
int comment_count = 0, keyword_count = 0, id_count = 0, line_count = 0, space_count = 0;
int non_id_count = 0 ; 
int multiline_comment_count = 0;
%}

keyword int|float|while|do|if|else|for|double|scanf|printf|return|include

%%
\/\/(.*)\n                      {++comment_count;}
\/\*(.|\n)*\*\/                 {++multiline_comment_count;}
\"(.)*\"                        {}
" "                             {++space_count;}
{keyword}                       {++keyword_count;printf("Keyword found: %s\n",yytext);}
([A-Za-z])([A-Za-z0-9_]*)       {++id_count;printf("Id found: %s\n",yytext);}
[0-9]*                          {++non_id_count;}
;\n|\n|;                        {++line_count;}
\<.*\>                          {}
.                  
%%

int yywrap(){
    return 1;
} 

int main(){  
    
    // Open the file
    char filename[50] = "dummy.txt";
    yyin = fopen(filename,"r"); 


    // Read the file
    yylex(); 

    // Print out counts
    printf("\n\nNumber of Comments: %d\n",comment_count);
    printf("Number of Multiline Comments: %d\n",multiline_comment_count);
    printf("Number of Keywords: %d\n",keyword_count);
    printf("Number of Identifiers: %d\n",id_count);
    printf("Number of Words: %d\n",id_count+non_id_count);
    printf("Number of Whitespaces: %d\n",space_count);
    printf("Number of Lines: %d\n",line_count);

    return 0; 
} 

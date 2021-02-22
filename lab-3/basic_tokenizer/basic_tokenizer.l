%{
#include <stdio.h>
int comment_count = 0, keyword_count = 0, id_count = 0, word_count = 0, line_count = 0, space_count = 0;
int multiline_comment_count = 0;
%}



%%
\/\/(.*)                {++comment_count;}
\/\*(.|\n)*\*\/         {++multiline_comment_count;}
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
    printf("Number of Comments: %d\n",comment_count);
    printf("Number of Multiline Comments: %d\n",multiline_comment_count);
    
    return 0; 
} 

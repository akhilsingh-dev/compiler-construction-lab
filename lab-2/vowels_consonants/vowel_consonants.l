/*PROGRAM TO COUNT NUMBER OF VOWELS AND CONSONANTS*/

%{
/* Definition Section*/

int vowel_count=0,consonant_count=0;

%}

vowel [aeiou]+
consonant [^aeiou]
eol \n


%%
 //RULES

{eol} return 0;
[ \t]+ ;
{vowel} {vowel_count++;}
{consonant} {consonant_count++;}

%%

int main() {
    printf("\nEnter a string : ");
    yylex();
    printf("Number of Vowels = %d \nNumber of Consonant = %d \n",vowel_count,consonant_count);
    return 0 ;
}

int yywrap() {
    return 1;
}

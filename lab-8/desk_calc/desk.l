DIGIT [0-9]+\.?|[0-9]*\.[0-9]+

%%

[ ]
{DIGIT}    {yylval=atof(yytext);return NUM;}
\n|.             {return yytext[0];}

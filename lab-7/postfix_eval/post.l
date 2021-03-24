DIGIT [0-9]

%%
{DIGIT}+    {yylval=atoi(yytext);return ID;}
[-+*/]      {return yytext[0];}
. ;
\n          yyterminate();

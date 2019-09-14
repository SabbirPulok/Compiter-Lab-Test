%option noyywrap

%{
    #include "cal.tab.h"
	#include<stdio.h>
	#include<stdlib.h>
%}

delim [ \t]
ws ({delim})+
digit [0-9]
number ({digit})+

%%
{ws} {}
{number} {yylval = atoi(yytext); return NUM;}
[A-Za-z] {yylval = yytext[0]; return VAR;}
"=" {return EQUOP;}
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
">" {return GT;}
"<"	{return LT;}
"|" {return ABS;}

"(" { return LPAREN;}
")"	{ return RPAREN;}
\n {return EOL; }

%%



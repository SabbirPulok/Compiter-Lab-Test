%option noyywrap

%{
    #include "cal.tab.h"
%}

delim [ \t\n]
ws ({delim})+
letter [A-Za-z]
digit [0-9]
id (_|{letter})({letter}|{digit})*
number ({digit}+)

%%
{number} {yylval=atoi(yytext); return NUMBER;}
"*" {return MUL;}
"/" {return DIV;}
"+" {return ADD;}
"-" {return SUB;}
"(" {return LPAREN;}
")" {return RPAREN;}
\n {return EOL;}
%%
%option noyywrap

%{
    #include "cal.tab.h"
%}



%%

"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"<" {return LT;}
">" {return GT;}

"|" {return ABS; }
\n  {return EOL;}
"(" {return LPAREN; }
")"  {return RPAREN;}

[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%
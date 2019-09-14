%option noyywrap
%{

void print(char *s);

enum yytokentype
{
    INT=250,
    DOUBLE=251,
    ID=252
};


%}

delim [ \t\n]
ws ({delim})+
digit [0-9]
digit1 ({digit})({digit})
digit2 ([0])([3])
digit3 ([0])([0-9])([1-9])|([1])([0-7])([0-9])|([1])([8])([0])

%%
{ws} {}
"(" {print("LP");}
")" {print("RP");}
{digit2} {print("MIDDLE NUMBER");}
{digit3} {print("LAST NUMBER");}
{digit1} {print("FIRST NUMBER");}

%%

void print(char *s)
{
    printf("%s %s\n", s, yytext);
}

int main()
{
    
    yylex();
    return 0;
}

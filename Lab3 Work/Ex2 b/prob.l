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
varsity ([U])([E])([T])
uni ([B|C|R|K])({varsity})
dept1 ([M|C])([E])
dept2 ([C|E])([S|E])([E|E])
series ([0-9])([0-9])

%%
{ws} {}
"(" {print("LP");}
")" {print("RP");}
{uni} {print("UNIVERSITY");}
{dept1} {print("DEPT");}
{dept2} {print("DEPT");}
{series} {print("SERIES");}

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

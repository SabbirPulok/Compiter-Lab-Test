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
letter [A-Za-z]
digit [0-9]
id (_|{letter})({letter}|{digit})*
number ({digit}+)
float ({digit}+"."{digit}*)
increment ("+"{2})

%%
{ws} {}
"int" {print("INT");}
"double" {print("DOUBLE");}
"main" {print("MAIN FUNCTION");}
"while" {print("WHILE");}
{id} {print("ID");}
"(" {print("LP");}
")" {print("RP");}
"{" {print("LB");}
"}" {print("RB");}
"=" {print("ASSIGN");}
"+" {print("ADD");}
{number} {print("NUMBER");}
{float} {print("FLOATING NUMBER");}
{increment} {print("INCREMENT");}
";" {print("SCOLON");}
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

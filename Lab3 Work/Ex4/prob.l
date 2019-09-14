%option noyywrap
%{

void print(char *s);

enum yytokentype
{
    INT,DOUBLE,ID
};


%}

delim [ \t\n]
ws ({delim})+
letter [A-Za-z]
digit [0-9]
id (_|{letter})|({letter}|{digit})*
number ({digit}+)
float ({digit}+"."{digit}*)
literal (\"([^\\\"]|\\.)*\")

%%
{ws} {}
"Dim" {print("DIM");}
"Boolean" {print("BOOLEAN");}
"String" {print("STRING");}
"True" {print("TRUE");}
"as" {print("AS");}
"MsgBox" {print("MSGBOX");}
"Sub" {print("SUB");}
"End" {print("END");}

{literal} {print("LITERAL");}
{id} {print("ID");}
"(" {print("LP");}
")" {print("RP");}
"{" {print("LB");}
"}" {print("RB");}
"=" {print("ASSIGN");}
"+" {print("ADD");}
"&" {print("AND");}


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

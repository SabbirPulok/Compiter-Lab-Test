u%{
    #include<stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token NUMBER
%token MUL DIV ADD SUB EOL

%%
cal:
    | cal exp EOL {printf("%d\n> ",$2);}
    | cal EOL {}
    ;

exp: md
    | exp ADD md {$$=$1+$3;}
    | exp SUB md {$$=$1-$3;}
    ;
md:  md MUL NUMBER {$$=$1*$3;}
    | md DIV NUMBER {$$=$1/$3;}
    | star

star: LPAREN exp RPAREN {$$=$2;}
	| NUM
	;	
     
%%
int main()
{
    //printf("> ");
    yyparse();
}
void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

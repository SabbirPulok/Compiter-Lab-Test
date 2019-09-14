%{
    #include<stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token NUMBER
%token ADD SUB MUL DIV EOL ABS LPAREN RPAREN LT GT ABS

%%
calclist: /* nothing */                      
 | calclist exp EOL { printf("= %d\n", $2); } 
 ;

exp:        
	   exp ADD exp { $$ = $1 + $3; }
	 | LPAREN exp RPAREN { $$=$2 ;}
	 | exp SUB exp { $$ = $1 - $3; }
	 | exp MUL exp { $$ = $1 * $3; }
	 | exp DIV exp { $$ = $1 / $3; }
	 | exp LT exp  { $$=  $1<$3?1 : 0 ;}
	 | exp GT exp  { $$=  $1>$3?1 : 0 ;}
	 | ABS exp     { $$ = $2 >= 0? $2 : - $2; }
	 | ABS exp     { $$ = $2 >= 0? $2 : - $2; }
	 | NUMBER
	 
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

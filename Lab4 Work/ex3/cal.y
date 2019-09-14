%{
	#define YYDEBUG 1
    #include<stdio.h>
    void yyerror(char* s);
    int yylex();
	int values[100];
%}


%token NUM ADD SUB EOL MUL DIV VAR EQUOP

%start calc

%%

calc: calc VAR EQUOP expr EOL {values[$2] = $4;printf("%d\n> ",$4);}
	| calc VAR EQUOP NUM EOL {values[$2] = $4;printf("%d\n> ",$4);}
	| calc VAR EOL {printf("%c = %d\n> ",$2,values[$2]);}
	| /*epsilon*/
	;

expr: md 
	| expr ADD md {$$ = $1 + $3;}
	| expr SUB md {$$ = $1 - $3;}

md  : expr MUL expr {$$ = $1 * $3;}
	| NUM {$$ = $1;}
	| VAR {$$ = values[$1];}
	;
%%

int main()
{
	// extern int yydebug;
	// yydebug = 1;
    printf(">");
    yyparse();
	printf("Parsing Finished");
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
} 
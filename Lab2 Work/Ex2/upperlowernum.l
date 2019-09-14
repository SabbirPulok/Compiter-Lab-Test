%{
   int ul=0;
   int ll=0;
   int num=0;
%}

%%
[A-Z] {printf("%s is a Uppercase letter\n", yytext);
       ul++; }
[a-z] {printf("%s is a lowecase letter.\n",yytext);
        ll++;}
[0-9] {printf("%s is a number.\n",yytext);
        num++;}
. {printf("%s Error\n", yytext); }
\n {return 0;}

%%

int yywrap()
{

}

int main()
{
 yylex();
 printf("No of Uppercase letters = %d\n", ul);
 printf("No of Lowercase letters = %d\n", ll);
 printf("No of Numbers = %d\n", num);

 return 0;
}
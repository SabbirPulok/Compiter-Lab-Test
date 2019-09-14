main: cal.y cal.l
	bison -d cal.y  
	flex cal.l  
	gcc -o a.out cal.tab.c lex.yy.c  
	./a.out

clean: cal.tab.c lex.yy.c cal.tab.h a.out
	rm cal.tab.c lex.yy.c cal.tab.h a.out
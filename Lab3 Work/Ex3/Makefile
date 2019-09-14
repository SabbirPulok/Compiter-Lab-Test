input = input.txt
output = output.txt

main: prob.l
	flex prob.l
	gcc lex.yy.c
	./a.out <$(input)> $(output)
	
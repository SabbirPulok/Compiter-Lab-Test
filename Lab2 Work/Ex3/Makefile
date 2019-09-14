output: sample.c
	gcc sample.c -o output
	gcc sample.c -o sample.o
	gcc -S sample.c
	gcc -E sample.c > sample.i

clean:
	rm *.o output
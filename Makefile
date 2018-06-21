FLAGS = -Wall -ly
SCANNER = roX.l
GRAMMAR = roX.y
PARSER = roX.out


all:
	yacc -d $(GRAMMAR)
	lex $(SCANNER)
	gcc $(FLAGS) *.c -o $(PARSER)
clean:
	rm y.tab.*
	rm lex.yy.c 
	rm roX.out


.PHONY: all clean

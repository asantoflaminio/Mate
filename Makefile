SCANNER_RULES=roX.l
GRAMMAR=roX.y
PARSER=parser.out

.PHONY: clean		

all: 
	yacc -d $(GRAMMAR)
	lex $(SCANNER_RULES)
	gcc -o $(PARSER) lex.yy.c y.tab.c -ly
	@echo "Compilador compilado"

compile:
	./$(PARSER) < tests/factorial.esp > tests/factorial.c
	gcc -c -w tests/factorial.c
	gcc -w factorial.o -o factorial.out	
	./$(PARSER) < tests/potencia.esp > tests/potencia.c
	gcc -c -w tests/potencia.c
	gcc -w potencia.o -o potencia.out	
	./$(PARSER) < tests/primo.esp > tests/primo.c
	gcc -c -w tests/primo.c
	gcc -w primo.o -o primo.out	
	./$(PARSER) < tests/fibonacci.esp > tests/fibonacci.c
	gcc -c -w tests/fibonacci.c
	gcc -w fibonacci.o -o fibonacci.out	
	./$(PARSER) < tests/mcd.esp > tests/mcd.c
	gcc -c -w tests/mcd.c
	gcc -w mcd.o -o mcd.out	
	@echo "Tests compilados"

clean: 	
	rm -f *.out *.o $(PARSER) lex.yy.c y.tab.c y.tab.h test/factorial.c test/el_diego.c out.c


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
	@echo "Tests compilados"

clean: 	
	rm -f *.out *.o $(PARSER) lex.yy.c y.tab.c y.tab.h tests/factorial.c out.c


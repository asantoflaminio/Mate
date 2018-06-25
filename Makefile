SCANNER_RULES=scanner/roX.l
GRAMMAR=parser/roX.y
PARSER=parser.out

.PHONY: clean		

all: 
	yacc -d $(GRAMMAR)
	lex $(SCANNER_RULES)
	gcc -o $(PARSER) lex.yy.c y.tab.c -ly
	@echo "Compilador compilado"

compile:
	./$(PARSER) < test/factorial.arg > test/factorial.c
	gcc -c -w test/factorial.c
	gcc -w factorial.o -o factorial.out	
	./$(PARSER) < test/el_diego.arg > test/el_diego.c
	gcc -c -w test/el_diego.c
	gcc -w el_diego.o -o el_diego.out
	./$(PARSER) < test/cual_sos.arg > test/cual_sos.c
	gcc -c -w test/cual_sos.c
	gcc -w cual_sos.o -o cual_sos.out
	./$(PARSER) < test/cual_float_sos.arg > test/cual_float_sos.c
	gcc -c -w test/cual_float_sos.c
	gcc -w cual_float_sos.o -o cual_float_sos.out
	./$(PARSER) < test/for_test.arg > test/for_test.c
	gcc -c -w test/for_test.c
	gcc -w for_test.o -o for_test.out
	./$(PARSER) < test/calculadora.arg > test/calculadora.c
	gcc -c -w test/calculadora.c
	gcc -w calculadora.o -o calculadora.out
	@echo "Tests compilados"

clean: 	
	rm -f *.out *.o $(PARSER) lex.yy.c y.tab.c y.tab.h test/factorial.c test/el_diego.c test/for_test.c test/cual_sos.c test/calculadora.c test/cual_float_sos.c out.c

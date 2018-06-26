SCANNER=scanner/mate.l
GRAMMAR=parser/mate.y
PARSER=parser.out

.PHONY: clean		

all: 
	yacc -d $(GRAMMAR)
	@echo " -- Parser compilado -- "
	lex $(SCANNER)
	@echo " -- Scanner compilado -- "
	gcc -o $(PARSER) lex.yy.c y.tab.c -ly
	@echo " -- Parser compilado -- "

compile:
	./$(PARSER) < test/factorial.arg > test/factorial.c
	gcc -c -w test/factorial.c
	gcc -w factorial.o -o factorial.out	
	./$(PARSER) < test/el_diego.arg > test/el_diego.c
	gcc -c -w test/el_diego.c
	gcc -w el_diego.o -o el_diego.out
	./$(PARSER) < test/calculadora.arg > test/calculadora.c
	gcc -c -w test/calculadora.c
	gcc -w calculadora.o -o calculadora.out
	./$(PARSER) < test/conversor.arg > test/conversor.c
	gcc -c -w test/conversor.c
	gcc -w conversor.o -o conversor.out
	@echo " -- Tests compilados -- "

clean: 	
	rm -f *.out *.o $(PARSER) lex.yy.c y.tab.c y.tab.h test/factorial.c test/el_diego.c test/calculadora.c test/conversor.c out.c

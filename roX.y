%{
	
	#include <stdio.h>
    	#include <stdlib.h>
    	#include <string.h>


%}

%union {
	int intval;
	char * strval;

	AssigmentNode * assigment;
	PrintNode * printnode;

	Block * block;

	Statements * statements;
}

%start start

%token BEGINPROGRAM ENDPROGRAM

%token PLUS MINUS MULT
%token PLUS_ONE SUB_ONE
%token ASSIGN

%token PRINT

%token <intval> NUM
%token <strval> IDENTIFIER
%token <strval> STR

%type <block> block
%type <statements> entry
%type <printnode> print;
%type <assigment> asig;

%%

start 		: BEGINPROGRAM entry ENDPROGRAM  { produce($2); }
			;

entry 		: block
			   {
				   	

				}
			| block entry
				{
						
				}

			;

block		: asig
				{	
					
				}
			| print 
				{
					
				}
			;



asig		: IDENTIFIER ASSIGN NUM 
				{ 
										
					

				} 	
			;

print 		: PRINT IDENTIFIER
				{
					
				}
	  		;

%%

int yywrap(void){
  	return 0;
}

int main(void){
    return yyparse();
}


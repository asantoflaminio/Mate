%{
	#include "ast.h"
	#include "y.tab.h"
	#include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #define MAX_IDS 10000

	int yylex();
	void yyerror (char const *s);


	int var_count = 0;

	char * identifiers[MAX_IDS] = {0};

	int getId(char * strId){
		int i;
		
		for(i = 0 ; i < MAX_IDS && identifiers[i] != NULL ; i++){
			if(strcmp(identifiers[i], strId) == 0){
				return i;
			}
		}

		if(i == MAX_IDS){
			return -1;
		}

		identifiers[i] = malloc(strlen(strId));
		strcpy(identifiers[i], strId);

		return i;

	}


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
				   	$$ = malloc(sizeof(*$$));
					$$->type = $1->type;;
					$$->expressionNode = $1->node;
					$$->next = NULL;
					
					free($1);

				}
			| block entry
				{
					$$ = malloc(sizeof(*$$));
				
					$$->type = $1->type;
					$$->expressionNode = $1->node;
					$$->next = $2;
					
					free($1);		
				}

			;

block		: asig
				{	
					$$ = malloc(sizeof(*$$));
					$$->type = ASSIGNMENT;
					$$->node = $1;
				}
			| print 
				{
					$$ = malloc(sizeof(*$$));
					$$->type = PRINT_CALL;
					$$->node = $1;
				}
			;



asig		: IDENTIFIER ASSIGN NUM 
				{ 
										
					$$ = malloc(sizeof(*$$));

					$$->var_id = getId($1);
					$$->type = INT_T;

					int * value = malloc(sizeof(int));

					memcpy(value, &$3, sizeof(int*));
					$$->value = value;

				} 	
			;

print 		: PRINT IDENTIFIER
				{
					$$ = malloc(sizeof(*$$));
					$$->var_id = getId($2);
				}
	  		;

%%

int yywrap(void){
  	return 0;
}

int main(void){
    return yyparse();
}


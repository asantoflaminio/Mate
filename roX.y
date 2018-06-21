%{
	#include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include <string.h>

    #define MAXVAR 300
    
    void yyerror(char* s);
    int symbolVal(char* symbol);
    void updateSymbolVal(char* symbol, int val);
    
    char* varsName[MAXVAR];
    int symbols[MAXVAR];

%}

%start START

%token BEGINPROGRAM ENDPROGRAM

%token PLUS MINUS MULT
%token PLUS_ONE MINUS_ONE
%token ASSIGN

%token PRINT

%token <num> NUM
%token <str> VAR
%token <str> STRING

%type <num>	START OP EXPRESS VALUE NUMBER

%%

START 	: BEGINPROGRAM OP START ENDPROGRAM 	{ ; }
	  	| OP
	  	;

OP 		: VAR ASSIGN EXPRESS { $$ = $3; updateSymbolVal($1, $$); } 	
	   	| PRINT VAR	{ printf("%d\n", $2); }
	   	;

EXPRESS : VAR { $$ = symbolVal($1); }
		| VALUE {$$ = $1; }
		; 

VALUE   : NUMBER { $$ = $1; }
		;

NUMBER	: NUM { $$ = $1; }
		;

%%

int yywrap(void){
  	return 0;
}

int main(void){
    return yyparse();
}

int computeSymbolIndex(char* token){ 
    int i = 0;
    for (; i < MAXVAR && varsName[i] != NULL; i++) {
        if (strcmp(varsName[i], token) == 0) {
            return i;
        }
    }

    if (i == MAXVAR) {
        yyerror("all variables slots have been used.");
        return -1;
    }
    
    varsName[i] = malloc(strlen(token)+1);
    strcpy(varsName[i],token);
    
    return i;
}

int symbolVal(char* symbol){
    int bucket = computeSymbolIndex(symbol);
    return symbols[bucket];
}

void updateSymbolVal(char* symbol, int val){
    int bucket = computeSymbolIndex(symbol);
    symbols[bucket] = val;
}

void yyerror(char* s){
    fprintf(stderr, "Error: %s\n", s);
}
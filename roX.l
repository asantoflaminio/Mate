%{
	#include "y.tab.h"
%}

alpha						[a-zA-Z]
num							[0-9]
varName 					[A-Za-z][0-9A-Za-z_-]*

%%	

EMPEZAR						return BEGINPROGRAM;
TERMINAR					return ENDPROGRAM;

vale						return ASSIGN;
es\ igual\ a				return ASSIGN;
=							return ASSIGN;

incrementar\				return PLUS_ONE;
decrementar\				return SUB_ONE;

mas							return PLUS;
menos						return MINUS;
multiplicado\ por\ 			return MULT;

mostrar						return PRINT;

\".+\"						return STRING;

{varName}					{	yylval.str = malloc(strlen(yytext)+1);
								strcpy(yylval.str, yytext);
								return IDENTIFIER;	
							}

{num}+						{	yylval.num = atoi(yytext); 
								return NUM;
							}

.							;

%%	

int yywrap(void){
	return 1;
}

int main(void){
	yylex();
	return 0;
}

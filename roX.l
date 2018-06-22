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

\".+\"						return STR;

{varName}					{	yylval.strval = malloc(strlen(yytext)+1);
								strcpy(yylval.strval, yytext);
								return IDENTIFIER;	
							}

{num}+						{	yylval.intval = atoi(yytext); 
								return NUM;
							}

\"[^\"]*\"					{  	char * str = malloc(strlen(yytext) - 1);
								strncpy(str, yytext + 1, strlen(yytext) - 2);
								yylval.strval = str;
								return STR;
							}

.                     		return yytext[0];

%%	

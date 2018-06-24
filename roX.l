%{
#include "y.tab.h"
#include <strings.h>
#include <stdlib.h>
%}


START "buenas"
END_PROG "ni nos vimo"

STRING ["][^\n\r]*["] 
COMA ","
AMPERSAND "&"
INTEGER [-]?[0-9]+
TRUE "la posta"
FALSE chamuyo

INT_VAR entero
DIEGO "el Diego"
STRING_VAR frase
VAR_NAME [A-Za-z][0-9A-Za-z_]*

IF "chequeame si"
ELSE sino
DO metele
WHILE "siempre que"

OPEN_BLOCK "{"
CLOSE_BLOCK "}"

OPEN_PARENTHESIS "("
CLOSE_PARENTHESIS ")"

OP_ASSIGN " sos "

OP_SUM " mas "
OP_SUB " menos "
OP_DIV " dividido "
OP_MUL " por "

OP_PLUS_ONE "aplicar tarifazo"
OP_SUB_ONE "devaluar"

OP_OR " o "
OP_AND " y " 
OP_NEG " ni ahi "

OP_LT " es menos piola que "
OP_GT " es mas piola que "
OP_EQ " es "
OP_DIST " nada que ver con "
OP_LE " es o es menos piola que "
OP_GE " es o es mas piola que "
OP_MODULO " modulo "

OP_PRINT "tirame la posta"
OP_IN "leete algo"

END_INSTR ";"


%%

{INTEGER}				{ yylval.number = atoi(yytext); 
						  return INTEGER;
						}

{STRING}				{ yylval.string = yytext; 
						  return STRING;
						}

{COMA}                  return COMA;
{AMPERSAND}				return AMPERSAND;
{TRUE}					return TRUE;
{FALSE}					return FALSE;

{INT_VAR}				return INT_VAR;
{DIEGO}				    return DIEGO;
{STRING_VAR}			return STRING_VAR;

{IF}					return IF;
{ELSE}					return ELSE;
{DO}					return DO;
{WHILE}					return WHILE;

{OPEN_PARENTHESIS}		return OPEN_PARENTHESIS;
{CLOSE_PARENTHESIS}		return CLOSE_PARENTHESIS;
{OPEN_BLOCK} 			return OPEN_BLOCK;
{CLOSE_BLOCK} 			return CLOSE_BLOCK;

{OP_ASSIGN}				return OP_ASSIGN;
{OP_SUM}				return OP_SUM;
{OP_SUB}				return OP_SUB;
{OP_MUL}				return OP_MUL;
{OP_MODULO}             return OP_MODULO;

{OP_PLUS_ONE}			return OP_PLUS_ONE;
{OP_SUB_ONE}			return OP_SUB_ONE;

{OP_OR}					return OP_OR;
{OP_AND}				return OP_AND;
{OP_NEG}				return OP_NEG;

{OP_LT}					return OP_LT;
{OP_GT}					return OP_GT;
{OP_LE}					return OP_LE;
{OP_GE}					return OP_GE;
{OP_EQ}					return OP_EQ;
{OP_DIST}				return OP_DIST;
{OP_PRINT}				return OP_PRINT;
{OP_IN}					return OP_IN;

{START}					return START;
{END_PROG}				return END_PROG;

{END_INSTR}				return END_INSTR;

[ \t\r\n]				ECHO;

<<EOF>>					return 0;

{VAR_NAME}				{yylval.string = yytext; return VAR_NAME;}
.						{fprintf(stderr, "Invalid input.");}

%%



%{
#include "y.tab.h"
#include <strings.h>
#include <stdlib.h>
%}


ENTER ^"\n"

START "hola"
END_PROG "ni nos vimo"

STRING ["][^\n\r]*["] 
COMA ","
AMPERSAND "&"
INTEGER [-]?[0-9]+
TRUE verdadero
FALSE falso

INT_VAR entero
STRING_VAR cadena
VAR_NAME [a-zA-Z]+

IF si
ELSE sino
DO hacer
WHILE mientras

OPEN_PARENTHESIS "¿"
CLOSE_PARENTHESIS "?"

OPEN_BLOCK "<"
CLOSE_BLOCK ">"

OP_ASSIGN " vale "

OP_SUM " mas "
OP_SUB " menos "
OP_DIV " dividido "
OP_MUL " multiplicado "

OP_PLUS_ONE "aumentar"
OP_SUB_ONE "decrementar"

OP_OR " o "
OP_AND " y " 
OP_NEG " no "

OP_LT " menor "
OP_GT " mayor "
OP_EQ " igual "
OP_DIST " distinto "
OP_LE " menor igual "
OP_GE " mayor igual "
OP_MODULO " modulo "

OP_PRINT "imprime"
OP_IN "entrada"

END_INSTR "."


%%
{INTEGER}				{yylval.number = atoi(yytext); return INTEGER;}
{STRING}				{yylval.string = yytext; return STRING;}
{COMA}                                  return COMA;
{AMPERSAND}				return AMPERSAND;
{TRUE}					return TRUE;
{FALSE}					return FALSE;

{INT_VAR}				return INT_VAR;
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
{OP_MODULO}                             return OP_MODULO;

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

{ENTER}					return ENTER;
{END_INSTR}				return END_INSTR;

[ \t]					ECHO;

<<EOF>>					return 0;

{VAR_NAME}				{yylval.string = yytext; return VAR_NAME;}
.						{fprintf(stderr, "Invalid input.");}
%%



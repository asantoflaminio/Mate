%{
#include "y.tab.h"
#include <strings.h>
#include <stdlib.h>
%}


START "buenas"
FINISH "ni nos vimo"

STRING ["][^\n\r]*["]
CHARACTER ['][^\n\r0-9]['] 
CHAR [^\n\r]
COMMA ","
COLON ":"
AMPERSAND "&"
INTEGER [-]?[0-9]+
FLOAT [0-9]*\.[0-9]+"f"?
TRUE "la posta"
FALSE chamuyo

INT_VAR entero
FLOAT_VAR "con coma"
ARRAY_INT_VAR "mix de numeros"
ARRAY_STR_VAR "mix de frases"
DIEGO "el Diego"
STRING_VAR frase
CHAR_VAR char 
VAR_NAME [A-Za-z][0-9A-Za-z_]*
SQ_BRACKETS "[]"
OPEN_SQ_BRACKET "["
CLOSE_SQ_BRACKET "]"

IF "chequeame si"
ELSE sino
DO metele
WHILE "siempre que"
FOR "vengan de a uno empezando por"

SWITCH "depende de lo que venga en"
CASE "si es un"
DEFAULT "si no queda otra"
BREAK "basta chicos"

OPEN_BRACKET "{"
CLOSE_BRACKET "}"

OPEN_PARENTHESIS "("
CLOSE_PARENTHESIS ")"

ASSIGNATION " sos "

ADD " mas "
SUB " menos "
DIV " dividido "
MULTIPLY " por "

INCREMENT "aplicar tarifazo"
DECREMENT "devaluar"

OR " o "
AND " y " 
NEGATIV " ni ahi "

LOWERTHAN " es menos piola que "
GREATERTHAN " es mas piola que "
EQUAL " es "
DIST " nada que ver con "
LOWEREQUAL " es o es menos piola que "
GREATEREQUAL " es o es mas piola que "
MODULO " modulo "

PRINTF "tirame la posta"
SCAN "leete algo"

END_INSTR ";"


%%

{INTEGER}				{ yylval.number = atoi(yytext); 
						  return INTEGER;
						}
						
{FLOAT}					{ yylval.floatValue = atof(yytext);
						  return FLOAT;
						}


{STRING}				{ yylval.string = yytext; 
						  return STRING;
						}

{CHARACTER}				{ yylval.string = yytext; 
						  return CHARACTER;
						}																		

{TRUE}					return TRUE;
{FALSE}					return FALSE;

{ASSIGNATION}			return ASSIGNATION;
{INT_VAR}				return INT_VAR;
{FLOAT_VAR}				return FLOAT_VAR;
{ARRAY_INT_VAR}			return ARRAY_INT_VAR;
{ARRAY_STR_VAR}			return ARRAY_STR_VAR;
{DIEGO}				    return DIEGO;
{STRING_VAR}			return STRING_VAR;
{CHAR_VAR}				return CHAR_VAR;

{IF}					return IF;
{ELSE}					return ELSE;
{DO}					return DO;
{WHILE}					return WHILE;
{FOR}					return FOR;

{SWITCH}				return SWITCH;
{CASE}					return CASE;
{DEFAULT}				return DEFAULT;
{BREAK}					return BREAK;

{OPEN_PARENTHESIS}		return OPEN_PARENTHESIS;
{CLOSE_PARENTHESIS}		return CLOSE_PARENTHESIS;
{OPEN_BRACKET} 			return OPEN_BRACKET;
{CLOSE_BRACKET} 		return CLOSE_BRACKET;
{SQ_BRACKETS}			return SQ_BRACKETS;
{OPEN_SQ_BRACKET}		return OPEN_SQ_BRACKET;
{CLOSE_SQ_BRACKET}		return CLOSE_SQ_BRACKET;
{COMMA}                 return COMMA;
{COLON}					return COLON;
{AMPERSAND}				return AMPERSAND;

{ADD}				    return ADD;
{SUB}				    return SUB;
{DIV}					return DIV;
{MULTIPLY}				return MULTIPLY;
{MODULO}                return MODULO;

{INCREMENT}			    return INCREMENT;
{DECREMENT}			    return DECREMENT;

{OR}					return OR;
{AND}				    return AND;
{NEGATIV}				return NEGATIV;

{LOWERTHAN}				return LOWERTHAN;
{GREATERTHAN}			return GREATERTHAN;
{LOWEREQUAL}			return LOWEREQUAL;
{GREATEREQUAL}			return GREATEREQUAL;
{EQUAL}					return EQUAL;
{DIST}				    return DIST;
{PRINTF}				return PRINTF;
{SCAN}					return SCAN;

{START}					return START;
{FINISH}				return FINISH;

{END_INSTR}				return END_INSTR;

[ \t\r\n]				ECHO;
	

<<EOF>>					return 0;

{VAR_NAME}				{ yylval.string = yytext; return VAR_NAME;}

{CHAR}					{ yylval.string = yytext; 
						  return CHARACTER;
						}


%%
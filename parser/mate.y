%{
#include <stdio.h>
void yyerror(const char *s);
int yylex();

%}

%error-verbose

%union 
{
        int number;
        char *string;
        char character;
        float floatValue;
}

%token <string> VAR_NAME;
%token <number> INTEGER;
%token <string> STRING;
%token <string> CHARACTER;
%token <floatValue> FLOAT;
%token TRUE;
%token FALSE;
%token INT_VAR;
%token FLOAT_VAR;
%token ARRAY_INT_VAR;
%token ARRAY_STR_VAR;
%token STRING_VAR;
%token CHAR_VAR;
%token DIEGO;
%token UNA_GAMBA;
%token UNA_LUCA;
%token UN_PALO;
%token IF;					
%token ELSE;
%token DO; 					
%token WHILE; 
%token FOR;
%token SWITCH;
%token CASE;
%token DEFAULT;
%token BREAK;				
%token OPEN_PARENTHESIS;
%token CLOSE_PARENTHESIS;
%token OPEN_BRACKET;
%token CLOSE_BRACKET;
%token SQ_BRACKETS;
%token OPEN_SQ_BRACKET;
%token CLOSE_SQ_BRACKET;
%token COMMA;
%token COLON;
%token AMPERSAND;
%token ASSIGNATION;
%token ADD;
%token SUB;
%token DIV;
%token MULTIPLY;
%token MODULO;
%token INCREMENT;
%token DECREMENT;
%token OR;
%token AND;
%token NEGATIV;
%token LOWERTHAN;
%token GREATERTHAN;
%token LOWEREQUAL;
%token GREATEREQUAL;
%token EQUAL;
%token DIST;
%token PRINTF;
%token SCAN;
%token START;
%token FINISH;
%token END_INSTR;

%start comienza

%%

comienza : start code finish;

start : START {
	printf("int main(){");
};

finish : FINISH{
	printf("}");
}

code : instruction code | control_sequence code | /*empty*/ ;

instruction : declaration assign end_instr 
			| declaration assign_string end_instr
			| declaration_array_int assign_array_int end_instr
			| declaration_array_str assign_array_str end_instr
			| declaration end_instr 
			| print end_instr
			| in end_instr 
			| var_name assign end_instr 
			| var_name assign_string end_instr 
			| var_name increment end_instr
			| var_name decrement end_instr
			| declaration assign_access_array;

assign_access_array : assignation var_name open_sq_bracket integer close_sq_bracket end_instr;

declaration : type var_name;

declaration_array_int : array_int_var var_name sq_brackets;

declaration_array_str : array_str_var var_name sq_brackets;

type : int_var | string_var | char_var | float_var;

sq_brackets : SQ_BRACKETS{
	printf("[]");
}; 

open_sq_bracket : OPEN_SQ_BRACKET{
	printf("[");
}; 

close_sq_bracket : CLOSE_SQ_BRACKET{
	printf("]");
}; 

int_var : INT_VAR{
	printf("int");
}; 

el_diego : DIEGO{
	printf("10");
}; 

una_gamba : UNA_GAMBA{
	printf("100");
}; 

una_luca : UNA_LUCA{
	printf("1000");
}; 

un_palo : UN_PALO{
	printf("1000000");
}; 

string_var : STRING_VAR{
	printf("char *");
};

char_var : CHAR_VAR{
	printf("char");
};

float_var : FLOAT_VAR{
	printf("float");	
};

array_int_var : ARRAY_INT_VAR{
	printf("int");	
};

array_str_var : ARRAY_STR_VAR{
	printf("char*");	
};

array_int : open_bracket close_bracket 
          | open_bracket array_exp integer close_bracket 
          | open_bracket integer close_bracket;

array_exp : array_exp integer comma | integer comma;

array_str : open_bracket close_bracket 
          | open_bracket array_exp_str string close_bracket 
          | open_bracket string close_bracket;

array_exp_str : array_exp string comma | string comma;

print : printf open_parenthesis string cerrar_print;

cerrar_print : comma expression cerrar_print | close_parenthesis;

in : scan open_parenthesis string cerrar_in; 

cerrar_in : comma ampersand var_name close_parenthesis | comma ampersand var_name cerrar_in;

comma : COMMA {
	printf(",");     
};

ampersand : AMPERSAND{
	printf("&");
};

control_sequence : if_block | loop | switch_block;

if_block : if open_parenthesis boolean_expression close_parenthesis open_bracket code close_bracket 
| if open_parenthesis boolean_expression close_parenthesis open_bracket code close_bracket else if_block
| if open_parenthesis boolean_expression close_parenthesis open_bracket code close_bracket else open_bracket code close_bracket;

if : IF {
	printf("if");
};

open_bracket : OPEN_BRACKET {
	printf("{");
};

close_bracket : CLOSE_BRACKET {
	printf("}");
};

else : ELSE {
	printf("else");
};

loop : do open_bracket code close_bracket while open_parenthesis boolean_expression close_parenthesis end_instr 
| while open_parenthesis boolean_expression close_parenthesis open_bracket code close_bracket
| for open_parenthesis instruction boolean_expression end_instr var_name increment close_parenthesis open_bracket code close_bracket
| for open_parenthesis instruction boolean_expression end_instr var_name decrement close_parenthesis open_bracket code close_bracket
;

do : DO {
	printf("do");
};

while : WHILE {
	printf("while");
};

for : FOR {
	printf("for");
};


switch_block : switch open_parenthesis var_name close_parenthesis open_bracket inside_switch close_bracket;

inside_switch : case character colon code break end_instr default_switch | case character colon code break end_instr inside_switch;

default_switch : default colon code;

switch : SWITCH {
	printf("switch");	
};

case : CASE {
	printf("case");	
};

colon : COLON {
	printf(":");     
};

default : DEFAULT {
	printf("default");	
};

break : BREAK {
	printf("break");
};

printf : PRINTF {
	printf("printf");
};

scan : SCAN{
	printf("scanf");
};

increment : INCREMENT {
	printf("++");
};

decrement : DECREMENT {
	printf("--");
};

var_name : VAR_NAME {
	printf("%s",$1);	 
};

string : STRING{
	printf("%s",$1); 
};

character : CHARACTER{
	printf("%s", $1);
};

assign : assignation expression;

assign_string : assignation string;

assign_array_int : assignation array_int;

assign_array_str : assignation array_str;

assignation : ASSIGNATION {
	printf("=");
};

boolean_expression : boolean_expression or boolean_term | boolean_term;

boolean_term : boolean_term and boolean_factor | boolean_factor;

boolean_factor : open_parenthesis boolean_expression close_parenthesis | negativ boolean_factor | boolean;

boolean : true | false | comparation;

true : TRUE{
	printf("1");
}; 

false : FALSE{
	printf("0");
};		

comparation : expression compare_operator expression;

expression : open_parenthesis expression add term close_parenthesis
 		   | open_parenthesis expression sub term close_parenthesis
		   | term
		   | expression add term 
		   | expression sub term
		   | expression modulo term;


term : open_parenthesis term multiply factor close_parenthesis
	 | open_parenthesis term div factor close_parenthesis
	 | term factor 
	 | factor
	 | term multiply factor 
	 | term div factor
	 | el_diego
	 | una_gamba
	 | una_luca
	 | un_palo;

factor : var_name 
	   | integer 
	   | float 
	   | var_name open_sq_bracket var_name close_sq_bracket 
	   | var_name open_sq_bracket integer close_sq_bracket; 


integer : INTEGER{
	printf("%d",$1);
};

float : FLOAT{
	printf("%f",$1);
};

compare_operator : lowerthan 
				 | greaterthan 
				 | equal 
				 | dist
				 | lowerequal
				 | greaterequal;

or : OR {
	printf("||");
};

and : AND {
	printf("&&");
};

multiply : MULTIPLY {
	printf("*");
};

add : ADD {
	printf("+");
};

sub : SUB {
	printf("-");
};

div : DIV {
	printf("/");
};

negativ : NEGATIV {
	printf("!");
};

lowerthan : LOWERTHAN {
	printf("<");
};

greaterthan : GREATERTHAN {
	printf(">");
};

equal : EQUAL {
	printf("==");
};

dist : DIST {
	printf("!=");
};

lowerequal : LOWEREQUAL {
	printf("<=");
};

greaterequal : GREATEREQUAL {
	printf(">=");
};

modulo : MODULO {
	printf("%%");	 
};

end_instr : END_INSTR {
	printf(";");
};

open_parenthesis : OPEN_PARENTHESIS {
	printf("(");
};

close_parenthesis : CLOSE_PARENTHESIS {
	printf(")");
};

%%

int yywrap(){
	return 1;
}

int main (){
	yyparse();
}

void
yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}

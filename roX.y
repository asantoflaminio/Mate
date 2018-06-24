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
}

%token <number> INTEGER;
%token <string> STRING;
%token TRUE;
%token FALSE;
%token INT_VAR;
%token DIEGO;
%token STRING_VAR;
%token <string> VAR_NAME;
%token IF;					
%token ELSE;
%token DO; 					
%token WHILE; 	
%token FOR;
%token OPEN_PARENTHESIS;
%token CLOSE_PARENTHESIS;
%token OPEN_BLOCK;
%token CLOSE_BLOCK;
%token OP_ASSIGN;
%token OP_SUM;
%token OP_SUB;
%token OP_DIV;
%token OP_MUL;
%token OP_MODULO;
%token OP_PLUS_ONE;
%token OP_SUB_ONE;
%token OP_OR;
%token OP_AND;
%token OP_NEG;
%token OP_LT;
%token OP_GT;
%token OP_LE;
%token OP_GE;
%token OP_EQ;
%token OP_DIST;
%token OP_PRINT;
%token OP_IN;
%token START;
%token END_PROG;
%token END_INSTR;
%token COMA;
%token AMPERSAND;

%start comienza
%%

comienza : start code end_prog;

start: START {
	printf("int main(){");
};

end_prog: END_PROG{
	printf("}");
}

code : instruction code | control_sequence code | /*empty*/;

instruction : declaration assign end_instr 
| declaration assign_string end_instr
| declaration end_instr 
| print end_instr
| in end_instr 
| var_name assign end_instr 
| var_name assign_string end_instr 
| var_name op_plus_one end_instr
| var_name op_sub_one end_instr;

declaration: type var_name;

type: int_var
|string_var;

int_var: INT_VAR{
	printf("int");
}; 

el_diego: DIEGO{
	printf("10");
}; 


string_var: STRING_VAR{
	printf("char *");
}

print: op_print open_parenthesis string coma string close_parenthesis
| op_print open_parenthesis string coma var_name close_parenthesis
| op_print open_parenthesis string coma integer close_parenthesis
| op_print open_parenthesis string close_parenthesis
;

in: op_in open_parenthesis string cerrar_in; 

cerrar_in: coma ampersand var_name close_parenthesis | coma ampersand var_name cerrar_in;

coma : COMA {
	printf(",");     
};

ampersand: AMPERSAND{
	printf("&");
}

control_sequence : if_block | loop;

if_block : if open_parenthesis boolean_expression close_parenthesis open_block code close_block 
| if open_parenthesis boolean_expression close_parenthesis open_block code close_block else if_block
| if open_parenthesis boolean_expression close_parenthesis open_block code close_block else open_block code close_block;

if : IF {
	printf("if");
};

open_block : OPEN_BLOCK {
	printf("{");
};

close_block : CLOSE_BLOCK {
	printf("}");
};

else : ELSE {
	printf("else");
};

loop : do open_block code close_block while open_parenthesis boolean_expression close_parenthesis 
| while open_parenthesis boolean_expression close_parenthesis open_block code close_block
| for open_parenthesis instruction boolean_expression end_instr var_name op_plus_one close_parenthesis open_block code close_block
| for open_parenthesis instruction boolean_expression end_instr var_name op_sub_one close_parenthesis open_block code close_block;

do : DO {
	printf("do");
};

while : WHILE {
	printf("while");
};

for : FOR {
	printf("for");
};

op_print: OP_PRINT {
	printf("printf");
};

op_in: OP_IN{
	printf("scanf");
}

op_plus_one: OP_PLUS_ONE {
	printf("++");
};

op_sub_one: OP_SUB_ONE {
	printf("--");
};

var_name : VAR_NAME {
	printf("%s",$1);	 
}

string: STRING{
	printf("%s",$1); 
};

assign: op_assign expression;

assign_string: op_assign string;

op_assign: OP_ASSIGN {
	printf("=");
}

boolean_expression: boolean_expression op_or boolean_term
					| boolean_term;

boolean_term: boolean_term op_and boolean_factor
			| boolean_factor;

boolean_factor: open_parenthesis boolean_expression close_parenthesis 
				| op_neg boolean_factor
				| boolean;

boolean: true 
		| false 
		| comparation;

true: TRUE{
	printf("1");
}		
false: FALSE{
	printf("0");
}		

comparation: expression compare_operator expression;

expression: open_parenthesis expression op_sum term close_parenthesis
			| open_parenthesis expression op_sub term close_parenthesis
			| term
			| expression op_sum term 
			| expression op_sub term
			| expression op_modulo term;


term: open_parenthesis term op_mul factor close_parenthesis
			| open_parenthesis term op_div factor close_parenthesis
			| term factor 
			| factor
			| term op_mul factor 
			| term op_div factor
            | el_diego;

factor: var_name | integer;

integer: INTEGER{
	printf("%d",$1);
}

compare_operator: op_lt 
				| op_gt 
				| op_eq 
				| op_dist
				| op_le
				| op_ge;

op_or: OP_OR {
	printf("||");
}

op_and: OP_AND {
	printf("&&");
}

op_mul: OP_MUL {
	printf("*");
}

op_sum: OP_SUM {
	printf("+");
}

op_sub: OP_SUB {
	printf("-");
}

op_div: OP_DIV {
	printf("/");
}

op_neg: OP_NEG {
	printf("!");
}

op_lt: OP_LT {
	printf("<");
}

op_gt: OP_GT {
	printf(">");
}

op_eq: OP_EQ {
	printf("==");
}

op_dist: OP_DIST {
	printf("!=");
}

op_le: OP_LE {
	printf("<=");
}

op_ge: OP_GE {
	printf(">=");
}

op_modulo: OP_MODULO {
	printf("%%");	 
}

end_instr: END_INSTR {
	printf(";");
};

open_parenthesis: OPEN_PARENTHESIS {
	printf("(");
};

close_parenthesis: CLOSE_PARENTHESIS {
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

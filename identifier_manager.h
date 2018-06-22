#ifndef __dtype_h
#define __dtype_h

#include <stdint.h>

#define INT_T 1
#define STR_T 2

#define MAX_VARS 1000

typedef uint8_t type_t;

typedef int VAR_ID;

typedef union{
		int intValue;
		char* strValue;
	} varValue;

typedef struct{
  	varValue value;
	type_t type;
} VAR;

void assign(VAR_ID id, void * value, type_t type);
VAR * get_var(VAR_ID id);

#endif
%{
	#include <stdio.h>
	int yylex(void);
	int yyerror(const char *s);
%}

/* basic types */
%token STRING INT INT32 INT64 UINT UINT32 UINT64 FLOAT BOOL BYTE BOOL_LITERAL

%%

statement: 
	| BOOL_LITERAL { printf("found bool"); }
	| INT { printf("found int"); }
	| STRING { printf("found string"); }

%%

int yyerror(const char *s) {
	fprintf(stderr, "error: %s\n", s);
	return 1;
}

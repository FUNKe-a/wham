%{
	#include <cstdlib>
	#include <iostream>

	extern int yylex(void);
	extern int yyparse();

  	void yyerror(const char *s);
%}

%code requires {
    #include <cstdint>
    #include <cstdio>
	#include <cstring>
}

%union {
	char *sval;
	int ival;
	int32_t i32val;
	int64_t i64val;
	uint32_t uival;
	uint32_t ui32val;
	uint64_t ui64val;
	float fval;
	bool bval;
	char byval;
}

/* basic types */
%token T_STRING T_INT T_INT32 T_INT64 T_UINT T_UINT32 T_UINT64 T_FLOAT T_BOOL T_BYTE

%token ASSIGN

%token <ival> V_INT
%token <fval> V_FLOAT
%token <sval> ID

%type <sval> typespec
%type <fval> number

%%

declaration:
    typespec ID ASSIGN number {
        std::cout << $1 << ' ' << $2 << ' ' << '=' << ' ' << $4 << std::endl;
        free($1);
        free($2);
    }
    ;

typespec:
    T_STRING  { $$ = strdup("string"); }
    | T_INT   { $$ = strdup("int"); }
    | T_INT32 { $$ = strdup("int32"); }
    | T_INT64 { $$ = strdup("int64"); }
    | T_UINT  { $$ = strdup("uint"); }
    | T_UINT32 { $$ = strdup("uint32"); }
    | T_UINT64 { $$ = strdup("uint64"); }
    | T_FLOAT { $$ = strdup("float"); }
    | T_BOOL  { $$ = strdup("bool"); }
    | T_BYTE  { $$ = strdup("byte"); }
    ;

number:
    V_INT    { $$ = static_cast<float>($1); }
    | V_FLOAT
    ;

%%

void yyerror(const char *s) {
	fprintf(stderr, "error: %s\n", s);
	exit(-1);
}

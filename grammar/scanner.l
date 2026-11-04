%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "parser.tab.hpp"
%}

%%

"string"    { return STRING; }
"int"       { return INT; }
"int32"     { return INT32; }
"int64"     { return INT64; }
"uint"      { return UINT; }
"uint32"    { return UINT32; }
"uint64"    { return UINT64; }
"float"     { return FLOAT; }
"bool"      { return BOOL; }
"byte"      { return BYTE; }

"true"|"false"          { yylval = 0; return BOOL_LITERAL; }

[ \t\n]+    { /* ignore whitespace */ }
.           { printf("Unknown character: %s\n", yytext); }

%%

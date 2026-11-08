%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "wham_parse.tab.hpp"
%}

DIGIT    [0-9]
ID       [a-z][a-z0-9]*

%%

"string"    { return T_STRING; }
"int"       { return T_INT; }
"int32"     { return T_INT32; }
"int64"     { return T_INT64; }
"uint"      { return T_UINT; }
"uint32"    { return T_UINT32; }
"uint64"    { return T_UINT64; }
"float"     { return T_FLOAT; }
"bool"      { return T_BOOL; }
"byte"      { return T_BYTE; }

{DIGIT}+ 			{ yylval.ival = atoi(yytext); return V_INT; }
{DIGIT}+\.{DIGIT}+ 	{ yylval.fval = atof(yytext); return V_FLOAT; }

{ID} 		{ yylval.sval = strdup(yytext); return ID; }

"="			{ return ASSIGN; }

[ \t\n]+    { /* ignore whitespace */ }
.           { printf("Unknown character: %s\n", yytext); }

%%




%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

if { printf("if statement"); }

%%

int main(void) {
	yylex();

	return EXIT_SUCCESS;
}

%{
	#include <stdio.h>
	void yyerror(const char* s);
	int condition = 1;	
%}

%union{
	int intValue;
	char* stringValue;
}

%token <stringValue> MONTH1
%token <stringValue> MONTH2
%token <stringValue> MONTH3
%token <stringValue> DATE
%token <stringValue> SPACE
%token <stringValue> NONSENSE
%token <stringValue> DEL
%%
sen:
| sen LIST

;

LIST:
| LIST VALIDDATE
;
VALIDDATE:
| LIST1 MONTH1
| LIST1 MONTH2
| LIST1 MONTH3

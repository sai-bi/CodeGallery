%x BOF
%{
	#include "stdio.h"
	#include "try.tab.h"
	int condition = 1;
%}

SPA ([[:space:]]|[?.,;])+
JAN Jan(uary)?
FEB Feb(ruary)?
MAR Mar(ch)?
APR Apr(il)?
MAY May
JUN Jun(e)?
JUL Jul(y)?
AUG Aug(ust)?
SEP Sep(t(ember)?)?
OCT Oct(ober)?
NOV Nov(ember)?
DEC Dec(ember)?

M {JAN}|{MAR}|{MAY}|{JUL}|{AUG}|{OCT}|{DEC}|{APR}|{JUN}|{SEP}|{NOV}|{FEB}
M1 {JAN}|{MAR}|{MAY}|{JUL}|{AUG}|{OCT}|{DEC}
M2 {APR}|{JUN}|{SEP}|{NOV}
M3 {FEB}

R (st|nd|th|rd)?

D ([1-9])|([12][0-9])|(30)|(31)

%%
{SPA}{M}{SPA}  {condition = 0;yylval.stringValue = strdup(yytext);yyless(yyleng-1);return MONTH;}
{SPA}{D}{R}{SPA} {condition = 0;yylval.stringValue = strdup(yytext);
yyless(yyleng-1);
return DATE;}
{M}{SPA}  {yylval.stringValue = strdup(yytext);
		yyless(yyleng-1);
		if(condition == 0){
			condition = 0;
			return NONSENSE;
		}
		else{
			condition = 0;
			return MONTH;
		}
} 
{D}{R}{SPA} {yylval.stringValue = strdup(yytext);
	yyless(yyleng-1);
	if(condition == 0){
		condition = 0;
		return NONSENSE;
	}	
	else{
		condition = 0;
		return DATE;
	}
}
.|[\n] {condition = 0;yylval.stringValue = strdup(yytext);return NONSENSE;} 

%%


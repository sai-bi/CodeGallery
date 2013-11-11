
%{
	#include "stdio.h"
	#include "betterBison.tab.h"
%}

SPA [[:space:]]+
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

M1 {JAN}|{MAR}|{MAY}|{JUL}|{AUG}|{OCT}|{DEC}
M2 {APR}|{JUN}|{SEP}|{NOV}
M3 {FEB}

R (st|nd|th|rd)?
del ([^0-9a-zA-Z])+
D ([1-9])|([12][0-9])|(30)|(31)|(34)

%%
{M1} {yylval.stringValue = strdup(yytext); return MONTH1;}
{M2} {yylval.stringValue = strdup(yytext); return MONTH2;}
{M3} {yylval.stringValue = strdup(yytext); return MONTH3;}
{D}{R}  {yylval.stringValue = strdup(yytext); return DATE;}
{SPA} {yylval.stringValue = strdup(yytext); return SPACE;}
{del} {yylval.stringValue = strdup(yytext);return DEL;}
.	{yylval.stringValue = strdup(yytext);return NONSENSE;}
%%

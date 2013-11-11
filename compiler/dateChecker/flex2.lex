%x BOF

%{ 
	#include "stdio.h"	
	void process(const char*, int length, int flag);
%}


SPACE [[:space:]]
SPACE1 {SPACE}+
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

RANK (st|nd|th|rd)?
DATE1 (([1-9])|([12][0-9])|(3[01])){RANK}
DATE2 (([1-9])|([12][0-9])|(30)){RANK}
DATE3 (([1-9])|([12][0-9])){RANK}

%%
	BEGIN(BOF); 
<BOF>(({JAN}{SPACE1}{DATE1})|{DATE1}{SPACE1}{JAN}){SPACE} process("January",yyleng,1);BEGIN(0); 
<BOF>(({FEB}{SPACE1}{DATE3})|{DATE3}{SPACE1}{FEB}){SPACE} process("February",yyleng,1);BEGIN(0);
<BOF>(({MAR}{SPACE1}{DATE1})|{DATE1}{SPACE1}{MAR}){SPACE} process("March",yyleng,1);BEGIN(0);
<BOF>(({APR}{SPACE1}{DATE2})|{DATE2}{SPACE1}{APR}){SPACE} process("April",yyleng,1);BEGIN(0);
<BOF>(({MAY}{SPACE1}{DATE1})|{DATE1}{SPACE1}{MAY}){SPACE} process("May",yyleng,1);BEGIN(0);
<BOF>(({JUN}{SPACE1}{DATE2})|{DATE2}{SPACE1}{JUN}){SPACE} process("June",yyleng,1);BEGIN(0);
<BOF>(({JUL}{SPACE1}{DATE1})|{DATE1}{SPACE1}{JUL}){SPACE} process("July",yyleng,1);BEGIN(0);
<BOF>(({AUG}{SPACE1}{DATE1})|{DATE1}{SPACE1}{AUG}){SPACE} process("August",yyleng,1);BEGIN(0);
<BOF>(({SEP}{SPACE1}{DATE2})|{DATE2}{SPACE1}{SEP}){SPACE} process("September",yyleng,1);BEGIN(0);
<BOF>(({OCT}{SPACE1}{DATE1})|{DATE1}{SPACE1}{OCT}){SPACE} process("October",yyleng,1);BEGIN(0);
<BOF>(({NOV}{SPACE1}{DATE2})|{DATE2}{SPACE1}{NOV}){SPACE} process("November",yyleng,1);BEGIN(0);
<BOF>(({DEC}{SPACE1}{DATE1})|{DATE1}{SPACE1}{DEC}){SPACE} process("December",yyleng,1);BEGIN(0);

	
{SPACE}(({JAN}{SPACE1}{DATE1})|{DATE1}{SPACE1}{JAN}){SPACE} process("January",yyleng,0); 
{SPACE}(({FEB}{SPACE1}{DATE3})|{DATE3}{SPACE1}{FEB}){SPACE} process("February",yyleng,0);
{SPACE}(({MAR}{SPACE1}{DATE1})|{DATE1}{SPACE1}{MAR}){SPACE} process("March",yyleng,0);
{SPACE}(({APR}{SPACE1}{DATE2})|{DATE2}{SPACE1}{APR}){SPACE} process("April",yyleng,0);
{SPACE}(({MAY}{SPACE1}{DATE1})|{DATE1}{SPACE1}{MAY}){SPACE} process("May",yyleng,0);
{SPACE}(({JUN}{SPACE1}{DATE2})|{DATE2}{SPACE1}{JUN}){SPACE} process("June",yyleng,0);
{SPACE}(({JUL}{SPACE1}{DATE1})|{DATE1}{SPACE1}{JUL}){SPACE} process("July",yyleng,0);
{SPACE}(({AUG}{SPACE1}{DATE1})|{DATE1}{SPACE1}{AUG}){SPACE} process("August",yyleng,0);
{SPACE}(({SEP}{SPACE1}{DATE2})|{DATE2}{SPACE1}{SEP}){SPACE} process("September",yyleng,0);
{SPACE}(({OCT}{SPACE1}{DATE1})|{DATE1}{SPACE1}{OCT}){SPACE} process("October",yyleng,0);
{SPACE}(({NOV}{SPACE1}{DATE2})|{DATE2}{SPACE1}{NOV}){SPACE} process("November",yyleng,0);
{SPACE}(({DEC}{SPACE1}{DATE1})|{DATE1}{SPACE1}{DEC}){SPACE} process("December",yyleng,0);
%%

int main(){
	yylex();	
}


void process(const char *s,int length,int flag){
	char num[2];
	int day;
	int numLength = 0;
	
	int i = 0;
	for(i = 0;i < length;i++){
		if(yytext[i] - '0' >= 0 && yytext[i] -'0' <= 9){
			num[numLength] = yytext[i];
			numLength++;	
		}	
		if(numLength == 2)
			break;
	}
	if(flag == 0)
		printf("%c",yytext[0]);
	printf("%s",s);
	day = atoi(num);

	if(day == 1){
		printf(" 1st");	
	}
	else if(day ==2){
		printf(" 2nd");	
	}
	else if(day == 3){
		printf(" 3rd");	
	}
	else{
		printf(" %dth",day);	
	}
	yyless(yyleng-1);	
}




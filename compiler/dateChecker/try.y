%{
	#include <stdio.h>
	void yyerror(const char* s);
	void process(char *month, char* date);
%}
%union{
	int intValue;
	char* stringValue;
}
%token <stringValue> NONSENSE
%token <stringValue> MONTH
%token <stringValue> DATE
%token <stringValue> SPACE
%%
SEN:
| SEN DATE MONTH{
	process($3,$2);
}
| SEN MONTH DATE{
	process($2,$3);
}
| MONTH DATE{
	process($1,$2);
}
| DATE MONTH{
	process($1,$2);
}
| SEN MONTH{
	int i = 0;
	for(i = 0;i < sizeof($2);i++){	
		if($2[i+1] == '\0')
			break;
		printf("%c",$2[i]);
	}
}
| SEN DATE{
	int i = 0;
	for(i = 0;i < sizeof($2);i++){	
		if($2[i+1] == '\0')
			break;
		printf("%c",$2[i]);
	}
}
| SEN NONSENSE{
	printf("%c",$2[0]);
}
| DATE{
	char* target;
	strncpy(target, $1,sizeof($1)-1);
	printf("%s",target);
}
| MONTH{
	char* target;
	strncpy(target, $1,sizeof($1)-1);
	printf("%s",target);
}
| NONSENSE{
	printf("%s",$1);
}; 

%%

void main(){
	yyparse();
}
void yyerror(const char* s){
	printf("Error!!!\n%s",s);
}

void process(char* month, char* date){
	char* a[12] ={
	"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	char* b[12] = {
	"January","February","March","April","May","June","July","August",
	"September","October","December"};
	int i = 0;
	int numLength = 0;
	char num[2];
	for(i = 0;i < sizeof(date);i++){
		if(date[i] - '0' >= 0 && date[i] -'0' <= 9){
			num[numLength] = date[i];
			numLength++;	
		}	
		if(numLength == 2)
			break;
	}
	int day = atoi(num);	
	int c[12] = {31,29,31,30,31,30,31,31,30,31,30,31};
	int result = 0;
	
	for(i = 0;i < 12;i++){
		if(strstr(month,a[i]) != NULL){
			if(day <= c[i]){
				if(day == 1)
					printf(" %s %dst ",b[i],day);
				else if(day == 2)
					printf(" %s %dnd ",b[i],day);
				else if(day == 3)	
					printf(" %s %drd ",b[i],day);
				else	
					printf(" %s %dth ",b[i],day);
			}
			else{
				printf("%s%s",month,date);
			}
			break;
		}	
	}
		
}

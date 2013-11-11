#include <stdio.h>
#include <stdlib.h>
#include "calc3.h"
#include "y.tab.h"
#define MAXSIZE 100000
int loopSize = 0;
int breakStack[MAXSIZE] = {0};
int continueStack[MAXSIZE] = {0};

static int lbl;

int ex(nodeType *p) {
    int lblx, lbly, lbl1, lbl2;

    if (!p) return 0;
    switch(p->type) {
    case typeCon:       
        printf("\tpush\t%d\n", p->con.value); 
        break;
    case typeId:        
        printf("\tpush\t%c\n", p->id.i + 'a'); 
        break;
    case typeOpr:
        switch(p->opr.oper) {
	case FOR:
		loopSize = loopSize + 1;
		ex(p->opr.op[0]);
		printf("L%03d:\n", lblx = lbl++);
		lbl1 = lbl++;
		continueStack[loopSize] = lbl1;
		ex(p->opr.op[1]);
		printf("\tjz\tL%03d\n", lbly = lbl++);	
		breakStack[loopSize] = lbly;
		ex(p->opr.op[3]);
		
		printf("L%03d:\n", lbl1);
		ex(p->opr.op[2]);
		printf("\tjmp\tL%03d\n", lblx);
		printf("L%03d:\n", lbly);
		loopSize = loopSize - 1;				
		break;
	case DO:
		loopSize = loopSize + 1;
        printf("L%03d:\n", lblx = lbl++);
		continueStack[loopSize] = lblx;
		lbly = lbl++;
		breakStack[loopSize] = lbly;
		ex(p->opr.op[0]);
		ex(p->opr.op[1]);
        printf("\tjz\tL%03d\n", lbly);
        printf("\tjmp\tL%03d\n", lblx);
        printf("L%03d:\n", lbly);
		loopSize = loopSize - 1;
		break;
	case BREAK:
		if(loopSize == 0){
			printf("SYNTAX ERROR: break\n");
			exit(EXIT_FAILURE);
		}
		else{
			printf("\tjmp\tL%03d\n", breakStack[loopSize]);
		}
		break;
	case CONTINUE:
		if(loopSize == 0){
			printf("SYNTAX ERROR: break\n");
			exit(EXIT_FAILURE);
		}
		else{	
			printf("\tjmp\tL%03d\n", continueStack[loopSize]);
		}
		break;
	case WHILE:
			loopSize = loopSize + 1;
            printf("L%03d:\n", lbl1 = lbl++);
			continueStack[loopSize] = lbl1;
            ex(p->opr.op[0]);
            printf("\tjz\tL%03d\n", lbl2 = lbl++);
            breakStack[loopSize] = lbl2;
			ex(p->opr.op[1]);
            printf("\tjmp\tL%03d\n", lbl1);
            printf("L%03d:\n", lbl2);
			loopSize = loopSize - 1;
            break;
        case IF:
            ex(p->opr.op[0]);
            if (p->opr.nops > 2) {
                /* if else */
                printf("\tjz\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("\tjmp\tL%03d\n", lbl2 = lbl++);
                printf("L%03d:\n", lbl1);
                ex(p->opr.op[2]);
                printf("L%03d:\n", lbl2);
            } else {
                /* if */
                printf("\tjz\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("L%03d:\n", lbl1);
            }
            break;
	case READ:
	    printf("\tread\n");
            printf("\tpop\t%c\n", p->opr.op[0]->id.i + 'a');
	    break;
        case PRINT:     
            ex(p->opr.op[0]);
            printf("\tprint\n");
            break;
        case '=':       
            ex(p->opr.op[1]);
            printf("\tpop\t%c\n", p->opr.op[0]->id.i + 'a');
            break;
        case UMINUS:    
            ex(p->opr.op[0]);
            printf("\tneg\n");
            break;
        default:
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);
            switch(p->opr.oper) {
            case '+':   printf("\tadd\n"); break;
            case '-':   printf("\tsub\n"); break; 
            case '*':   printf("\tmul\n"); break;
            case '/':   printf("\tdiv\n"); break;
            case '%':   printf("\tmod\n"); break;
            case '<':   printf("\tcompLT\n"); break;
            case '>':   printf("\tcompGT\n"); break;
            case GE:    printf("\tcompGE\n"); break;
            case LE:    printf("\tcompLE\n"); break;
            case NE:    printf("\tcompNE\n"); break;
            case EQ:    printf("\tcompEQ\n"); break;
	    case AND:   printf("\tand\n"); break;
	    case OR:    printf("\tor\n"); break;
            }
        }
    }
    return 0;
}

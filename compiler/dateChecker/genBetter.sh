#!/bin/bash 
bison -d betterBison.y
flex betterParse.l
gcc betterBison.tab.c lex.yy.c -lfl -o betterParse

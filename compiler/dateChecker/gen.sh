#!/bin/bash 
bison -d try.y
flex parse.l
gcc try.tab.c lex.yy.c -lfl -o parse

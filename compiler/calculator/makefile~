c5i: lex.yy.c y.tab.c c5i.c
	gcc -o c5i lex.yy.c y.tab.c c5i.c

c5c: lex.yy.c y.tab.c c5c.c
	gcc -o c5c lex.yy.c y.tab.c c5c.c

lex.yy.c: c5.l
	flex c5.l

y.tab.c: c5.y
	bison -y -d c5.y

sas: as.c as.tab.c
	gcc -o sas as.c as.tab.c

as.c: as.l
	flex -o as.c as.l

as.tab.c: as.y
	bison -d as.y

cal: cal.c cal.tab.c
	gcc -o cal cal.c cal.tab.c

cal.c: cal.l
	flex -o cal.c cal.l

cal.tab.c: cal.y
	bison -d cal.y

calx: calx.c calx.tab.c
	gcc -o calx calx.c calx.tab.c

calx.c: calx.l
	flex -o calx.c calx.l

calx.tab.c: calx.y
	bison -d calx.y

cleanc5:
	$(RM) lex.yy.c y.tab.c y.tab.h c5i c5c

cleanas:
	$(RM) as.c as.tab.c as.tab.h as

cleancal:
	$(RM) cal.c cal.tab.c cal.tab.h cal calx.c calx.tab.c calx.tab.h calx

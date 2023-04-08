cls
del lex.yy.c
flex new-lexical.l
bison -d syntaxic.y
gcc lex.yy.c syntaxic.tab.c -lfl -ly


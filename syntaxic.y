%{
#include<stdio.h>
#include "routines.h"
extern int  nbligne;
extern int col;
int yyparse();
int yylex();
int yyerror(char *s);
char natureidf;
char vType='n';
char sauvOP[20];
int vInt;
float vFloat;
char typeidf;
char tempidf[20];
FILE *yyin;
%}
%start S 
%union {
int num;
float numf;
char car;
char* str;
}  
%token import as mpt for1 in range numpy and or not if1 else1 while1 Type 
%token dpt vrg moins plus eg etoile div1 doublediv1 modulo infeg inf sup egeg  supeg noteg pf pd cd cf
%token <str>idf <str>com <num>int1 <numf>float1
%%
S : idf
%% 
int yyerror(char* msg)
{printf("%s ligne %d et colonne %d \n",msg,nbligne,col);
return 0;
}
int main(int argc, char *argv[])  {
yyin = fopen(argv[1], "r");
    if (yyin == NULL)
        printf("File doesn't exist");
    else{
        
        yyparse();
    }
     display();
return 0;
}


%{
#include "routines.h"
   #include<stdio.h>
   #include<stdlib.h>
   #include<string.h>
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
%union{
    int num;
    float numf;
    char* str;
    char* car;
}
%token import as mpt for1 in range numpy and or not if1 else1 while1 comment NEWLINE sautdligne tabulation
%token dpt vrg moins plus eg etoile div1 doublediv1 modulo infeg inf sup egeg  supeg noteg pf pd cd cf end
%token <str>idf <str>com <num>int1 <numf>float1 <car> char1 bool1 <str>mc_int <str>mc_float <str>mc_bool <str>mc_char
%right idf sautdligne

%%
S: ListInstr end{printf("programe correct syntaxiquement"); YYACCEPT;}|{printf("programe correct syntaxiquement"); YYACCEPT;};

SAUT : sautdligne{printf("saut syn\n");}

ListInstr: IMPORT SAUT S
          | AFFECTAION SAUT S
          | BOUCLE SAUT S
          | CONDITION SAUT S
          |
          ;

IMPORT: import lib as idf{printf("IMPORT INST\n");} 
        |
        ;
lib : numpy|mpt;

AFFECTAION: TYPE idf eg operant exarth AFFECTAION{printf("Affectation INST\n");}
            | ;

TYPE:       mc_int 
            | mc_float
            | mc_bool 
            | mc_char ;

operant : idf 
        | value 
        ;

value: int1 {vType='i'; vInt=$1;}
       |float1{vType='f'; vFloat=$1;}
       |char1{vType='c'; }
       |bool1{vType='b'; }
       ;

operations : moins
           | etoile
           | plus
           | div1 {strcpy(sauvOP,"/");}
           ;


exarth : operations operant exarth
        |
        { 
        if((strcmp(sauvOP,"/")==0) & (vInt == 0 || vFloat ==0)){
            printf("erreur :division par zero a la ligen %d , la colonne %d\n",nbligne,col);
        }
    };


BOUCLE:for1 idf in range pd intervale pf dpt SAUT BLOC_INST {printf("boule inst \n");}
            |;
intervale :  int1 vrg int1 
            | int1;
BLOC_INST:INST BLOC_INST |  INST |;
INST:AFFECTAION|IMPORT|BOUCLE|CONDITION;

CONDITION :ListInstr if1 explg ElseCond ListInstr;
ElseCond: else1 ListInstr 
    | ;
explg : pd explg pf
    | noteg pd explg pf
    | expcmp explgOP
    | ;

explgOP : 
    | or explg
    | and explg;
expcmp : operant cmpType operant ;
cmpType: sup 
    | inf 
    | egeg 
    | in;

%%

int yyerror(char* msg)
{printf("%s ligness %d et colonne %d \n",msg,nbligne,col);
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
    
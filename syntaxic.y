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

%union {
int num;
float numf;
char car;
char* str;
}  
%token import as mpt for1 in range numpy and or not if1 else1 while1 Type comment NEWLINE
%token dpt vrg moins plus eg etoile div1 doublediv1 modulo infeg inf sup egeg  supeg noteg pf pd cd cf
%token <str>idf <str>com <num>int1 <numf>float1 
%start S
%%
S: listeinst  { printf("programe correct syntaxiquement"); YYACCEPT;};


listeinst : boucle listeinst {printf("inst4");}
    | cond listeinst {printf("inst3");}
    | import_inst listeinst {printf("inst2");}
    | aff listeinst{printf("inst1");};
    
import_inst : import lib ;
lib : numpy|mpt;
operant : idf 
    | value ;

value: int1 {vType='i'; vInt=$1;}|float1{vType='f'; vFloat=$1;};

operations : moins
    | etoile
    | plus
    | div1 {strcpy(sauvOP,"/");};

aff : idf eg operant exarth ;

exarth : operations operant exarth|{ 
         
        if((strcmp(sauvOP,"/")==0) & (vInt == 0 || vFloat ==0)){
            printf("erreur :division par zero a la ligen %d , la colonne %d\n",nbligne,col);
        }
    };

cond :listeinst if1 explg ElseCond ;
ElseCond: else1 listeinst 
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

boucle : for1 idf in range pd intervale dpt  listeinst 
{
    if (search($2)  == NULL)
    {
         printf("Symentic error : NON DECLAREE a la ligen %d , la colonne %d\n",nbligne,col);
    }
    else {

        if (search($2)->type[1]  != vType)
        {
            printf("%c",search($2)->type[0]);
            printf("Symentic error : you are trying to assing type %s to %s \n",vType=='i'?"Pint":"Pfloat",$2);
        }
    }
};

intervale : int1 vrg int1 | int1;

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

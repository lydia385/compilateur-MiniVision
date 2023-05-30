%{
  #include<stdio.h>
  #include<string.h>
  #include "syn.tab.h" 

  int  nbligne = 1;
  int  col = 0;
  extern YYSTYPE yylval;
  // cd /mnt/c/Users/messa/Documents/GitHub/compilateur-MiniVision

%}
lettres [a-z]
lettreM [A-Z]
chiffres [0-9]
idf {lettreM}({lettres}|{chiffres})*
int1  "-"?{chiffres}+
float1 "-"?({chiffres}+)(".")({chiffres}+)
char1 \'[^']\'
bool1 true|false
nombre {chiffre}+
Type (Pfloat)|(Pint)|(Pchar)|(Pbool)
sauteLine \n+

SPACES [ \t]+
TEXT ({chiffres}|{lettres})
comment ^#[^\n]*\n
%%
"import" {col+=yyleng; return import;}
"as" {col+=yyleng;return as;}
"matplotlib.pyplot" {col+=yyleng; return mpt;}
"for" {printf("for\n"); col+=yyleng;return for1;}
"in" {printf("in\n");col+=yyleng;return in;}
"range" {printf("range\n");col+=yyleng;return range;}
"numpy" {col+=yyleng;return numpy;}
"and" {col+=yyleng;return and;}
"or" {col+=yyleng;return or;}
"not" {col+=yyleng;return not;}
"if" {col+=yyleng;return if1;}
"else" {col+=yyleng;return else1;}
"while" {col+=yyleng;return while1;}
"int"    {  yylval.str=strdup(yytext); printf ("ligne %d : mot cle  reconnue est %s \n", nbligne,yytext);col=col+strlen(yytext); return mc_int;} 
"float"    {  yylval.str=strdup(yytext); printf ("ligne %d : mot cle  reconnue est %s \n", nbligne,yytext);  col=col+strlen(yytext); return mc_float;} 
"bool"    {  yylval.str=strdup(yytext); printf ("ligne %d : mot cle  reconnue est %s \n", nbligne,yytext);  col=col+strlen(yytext); return mc_bool;} 
"char"    {  yylval.str=strdup(yytext); printf ("ligne %d : mot cle  reconnue est %s \n", nbligne,yytext);  col=col+strlen(yytext); return mc_char;}
[\t]  {printf("\n Sep_tab reconnu \n"); col += yyleng;return (tabulation);}

{int1} {   
            if(atoi(yytext)<-32768||atoi(yytext)>32768){printf("integer invalide");}
                         else{
                                yylval.num=atoi(yytext);     
                                printf("Ligne %d  int reconnu %s \n" ,nbligne, yytext ); 
                                col = col + strlen(yytext);
                                return int1;}}
{float1} { 
            yylval.numf=atof(yytext);
          printf("Ligne %d  float reconnu %s \n" ,nbligne, yytext );  
          col = col + strlen(yytext); 
          return float1;
        }
{char1}  {yylval.car=strdup(yytext);
      printf("Ligne %d char reconnu %s \n" ,nbligne, yytext ); 
      col = col + strlen(yytext); 
      return char1;}
{bool1} {yylval.car=strdup(yytext);
           printf("ligne %d : boolean reconnu %s \n",nbligne,yytext);
           col=col+strlen(yytext); 
           return bool1; }



{idf} { 
        if (yyleng>=8) {
            col = col+strlen(yytext);
            printf("IDF\n");
            yylval.str=strdup(yytext);									
						return idf;}
      }

{sauteLine} {printf("saut\n"); nbligne++;col = 0; return sautdligne;}
{comment} {printf("\n Comment reconnu \n"); col += yyleng; return (comment);}
":" {col+=yyleng;return dpt;}
";" {col+=yyleng;return ptveg;}
"," {col+=yyleng;return vrg;}
"-" {col+=yyleng;return moins;}
"+" {col+=yyleng;return plus;}
"=" {col+=yyleng;return eg;}
"*" {col+=yyleng;return etoile;}
"/" {col+=yyleng;return div1;}
"//" {col+=yyleng;return doublediv1;}
"%" {col+=yyleng;return modulo;}
"<=" {col+=yyleng;return infeg;}
"<" {col+=yyleng;return inf;}
">" {col+=yyleng;return sup;}
"==" {col+=yyleng;return egeg;}
">=" {col+=yyleng;return supeg;}
"!=" {col+=yyleng;return noteg;}
")" {col+=yyleng;return pf;}
"(" {col+=yyleng;return pd;}
"[" {col+=yyleng;return cd;}
"]" {col+=yyleng;return cf;}
"$" {return end;}
[ \t ] {col = col + strlen(yytext); }
. printf("Erreur lexicale ligne %d colonne %d sur l'entite %s\n",nbligne,col,yytext);
%%
int yywrap(void)
{
return 0;
}
%{
  #include<stdio.h>
  #include<string.h>
    #include "syntaxic.tab.h" 

  int  nbligne = 1;
  int  col = 0;
  extern YYSTYPE yylval;
  // cd /mnt/c/Users/messa/Documents/GitHub/compilateur-MiniVision
  //{bool1}  {yylval.car=atof(yytext); col += yyleng;          return (bool1);}
  //{char1}  {yylval.str=strdup(yytext) col += yyleng; return char1;}
%}
lettres [a-z]
lettreM [A-Z]
chiffres [0-9]
idf {lettreM}({lettres}|{chiffres})*
int1  "-"?{chiffres}+
float1 "-"?({chiffres}+)(".")({chiffres}+)
char1 ({lettres}|{lettreM}|{chiffres})+
bool1 "true"|"false"
nombre {chiffre}+
Type (Pfloat)|(Pint)|(Pchar)|(Pbool)

SPACES [ \t]+
TEXT ({chiffres}|{lettres})
comment ^#[^\n]*\n
%%
"import" {col+=yyleng; return import;}
"as"     {col+=yyleng;return as;}
"matplotlib.pyplot" {col+=yyleng; return mpt;}
"for" {col+=yyleng;return for1;}
"in"  {col+=yyleng;return in;}
"range" {col+=yyleng;return range;}
"numpy" {col+=yyleng;return numpy;}
"and"   {col+=yyleng;return and;}
"or"    {col+=yyleng;return or;}
"not"   {col+=yyleng;return not;}
"if"    {col+=yyleng;return if1;}
"else"  {col+=yyleng;return else1;}
"while" {col+=yyleng;return while1;}
{Type} {col=col+yyleng;  yylval.car=yytext[1];  return Type;}
{int1} {
            yylval.num=atoi(yytext);
            if ( (yylval.num>-32769)&&(yylval.num<32768)) 
                    {yylval.num=atoi(yytext);col=col+yyleng; return int1;}
            else printf("erreur lexicale la valeur de l'entier depasse la plage specifiee\n"); return int1;}
{float1} {yylval.numf=atof(yytext);  return float1;}
{idf}     {if (yyleng<=8) {yylval.str=strdup(yytext); col += yyleng; return idf;}}
":"   {col+=yyleng;return dpt;}
","   {col+=yyleng;return vrg;}
"-"   {col+=yyleng;return moins;}
"+"   {col+=yyleng;return plus;}
"="   {col+=yyleng;return eg;}
"*"   {col+=yyleng;return etoile;}
"/"   {col+=yyleng;return div1;}
"//"  {col+=yyleng;return doublediv1;}
"%"   {col+=yyleng;return modulo;}
"<="  {col+=yyleng;return infeg;}
"<"   {col+=yyleng;return inf;}
">"   {col+=yyleng;return sup;}
"=="  {col+=yyleng;return egeg;}
">="  {col+=yyleng;return supeg;}
"!="  {col+=yyleng;return noteg;}
")"   {col+=yyleng;return pf;}
"("   {col+=yyleng;return pd;}
"["   {col+=yyleng;return cd;}
"]"   {col+=yyleng;return cf;}


[\t]     {col += yyleng;}
{comment} {printf("\n Comment reconnu \n"); col += yyleng; return (comment);}
"."       {printf("\n point reconnu \n");col++;}
[ ]       { col++;}
.         {printf("Erreur lexicale au niveau de la ligne %d et colone %d \n",nbligne, col); col++;  }
%%
int yywrap(void)
{
return 0;
}
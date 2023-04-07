/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_SYNTAXIC_TAB_H_INCLUDED
# define YY_YY_SYNTAXIC_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    import = 258,                  /* import  */
    as = 259,                      /* as  */
    mpt = 260,                     /* mpt  */
    for1 = 261,                    /* for1  */
    in = 262,                      /* in  */
    range = 263,                   /* range  */
    numpy = 264,                   /* numpy  */
    and = 265,                     /* and  */
    or = 266,                      /* or  */
    not = 267,                     /* not  */
    if1 = 268,                     /* if1  */
    else1 = 269,                   /* else1  */
    while1 = 270,                  /* while1  */
    Type = 271,                    /* Type  */
    dpt = 272,                     /* dpt  */
    vrg = 273,                     /* vrg  */
    moins = 274,                   /* moins  */
    plus = 275,                    /* plus  */
    eg = 276,                      /* eg  */
    etoile = 277,                  /* etoile  */
    div1 = 278,                    /* div1  */
    doublediv1 = 279,              /* doublediv1  */
    modulo = 280,                  /* modulo  */
    infeg = 281,                   /* infeg  */
    inf = 282,                     /* inf  */
    sup = 283,                     /* sup  */
    egeg = 284,                    /* egeg  */
    supeg = 285,                   /* supeg  */
    noteg = 286,                   /* noteg  */
    pf = 287,                      /* pf  */
    pd = 288,                      /* pd  */
    cd = 289,                      /* cd  */
    cf = 290,                      /* cf  */
    idf = 291,                     /* idf  */
    com = 292,                     /* com  */
    int1 = 293,                    /* int1  */
    float1 = 294                   /* float1  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 19 "syntaxic.y"

int num;
float numf;
char car;
char* str;

#line 110 "syntaxic.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SYNTAXIC_TAB_H_INCLUDED  */

/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_SYN_TAB_H_INCLUDED
# define YY_YY_SYN_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     import = 258,
     as = 259,
     mpt = 260,
     for1 = 261,
     in = 262,
     range = 263,
     numpy = 264,
     and = 265,
     or = 266,
     not = 267,
     if1 = 268,
     else1 = 269,
     while1 = 270,
     comment = 271,
     NEWLINE = 272,
     sautdligne = 273,
     tabulation = 274,
     dpt = 275,
     vrg = 276,
     moins = 277,
     plus = 278,
     eg = 279,
     etoile = 280,
     div1 = 281,
     doublediv1 = 282,
     modulo = 283,
     infeg = 284,
     inf = 285,
     sup = 286,
     egeg = 287,
     supeg = 288,
     noteg = 289,
     pf = 290,
     pd = 291,
     cd = 292,
     cf = 293,
     end = 294,
     idf = 295,
     com = 296,
     int1 = 297,
     float1 = 298,
     char1 = 299,
     bool1 = 300,
     mc_int = 301,
     mc_float = 302,
     mc_bool = 303,
     mc_char = 304
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 20 "syn.y"

    int num;
    float numf;
    char* str;
    char* car;


/* Line 2058 of yacc.c  */
#line 114 "syn.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_SYN_TAB_H_INCLUDED  */

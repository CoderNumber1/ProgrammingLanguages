/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TOKENERROR = 258,
     COMMENTBEGIN = 259,
     COMMENTEND = 260,
     COMMENT = 261,
     ID = 262,
     AND = 263,
     ARRAY = 264,
     BEGAN = 265,
     DIV = 266,
     DO = 267,
     ELSE = 268,
     END = 269,
     FOR = 270,
     FUNCTION = 271,
     IF = 272,
     INTEGER = 273,
     MOD = 274,
     NOT = 275,
     OF = 276,
     OR = 277,
     PROCEDURE = 278,
     PROGRAM = 279,
     REAL = 280,
     REPEAT = 281,
     THEN = 282,
     TO = 283,
     UNTIL = 284,
     VAR = 285,
     WHILE = 286,
     REALIT = 287,
     INTLIT = 288,
     CHRLIT = 289,
     EQU = 290,
     NEQ = 291,
     LES = 292,
     LEQ = 293,
     GRT = 294,
     GEQ = 295,
     PLUS = 296,
     MINUS = 297,
     STAR = 298,
     SLASH = 299,
     ASSIGNOP = 300,
     LPAREN = 301,
     RPAREN = 302,
     LBRACKET = 303,
     RBRACKET = 304,
     COLON = 305,
     SEMICOLON = 306,
     COMMA = 307,
     PERIOD = 308,
     RANGE = 309
   };
#endif
/* Tokens.  */
#define TOKENERROR 258
#define COMMENTBEGIN 259
#define COMMENTEND 260
#define COMMENT 261
#define ID 262
#define AND 263
#define ARRAY 264
#define BEGAN 265
#define DIV 266
#define DO 267
#define ELSE 268
#define END 269
#define FOR 270
#define FUNCTION 271
#define IF 272
#define INTEGER 273
#define MOD 274
#define NOT 275
#define OF 276
#define OR 277
#define PROCEDURE 278
#define PROGRAM 279
#define REAL 280
#define REPEAT 281
#define THEN 282
#define TO 283
#define UNTIL 284
#define VAR 285
#define WHILE 286
#define REALIT 287
#define INTLIT 288
#define CHRLIT 289
#define EQU 290
#define NEQ 291
#define LES 292
#define LEQ 293
#define GRT 294
#define GEQ 295
#define PLUS 296
#define MINUS 297
#define STAR 298
#define SLASH 299
#define ASSIGNOP 300
#define LPAREN 301
#define RPAREN 302
#define LBRACKET 303
#define RBRACKET 304
#define COLON 305
#define SEMICOLON 306
#define COMMA 307
#define PERIOD 308
#define RANGE 309




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


